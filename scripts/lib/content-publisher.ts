import { execFile } from 'node:child_process';
import { copyFile, mkdir, readdir } from 'node:fs/promises';
import path from 'node:path';
import { promisify } from 'node:util';
import {
  DEPLOY_CONFIG_NAME,
  evaluateFile,
  loadLocalScope,
  scopesForDir,
  typstOutputPath,
  type DeployConfig,
  type DeployScope,
  type TypstAction,
} from './deploy-config';

const execFileAsync = promisify(execFile);

/** Extensions that are safe to publish as-is. */
export const ALLOWED_EXTENSIONS = new Set([
  '.pdf',
  '.txt',
  '.md',
  '.csv',
  '.json',
  '.png',
  '.jpg',
  '.jpeg',
  '.webp',
  '.gif',
  '.svg',
  '.zip',
  '.py',
  '.c',
  '.h',
  '.cpp',
  '.hpp',
  '.java',
  '.ipynb',
]);

export const IGNORED_NAMES = new Set(['.DS_Store', 'Thumbs.db', '__pycache__']);

export type CompileFn = (
  source: string,
  destination: string,
  rootDir: string,
) => Promise<void>;

export interface WalkedFile {
  absolute: string;
  /** Path relative to the tree root being published, POSIX separators. */
  treeRelative: string;
  /** Path relative to content/raw, POSIX separators. */
  contentRelative: string;
  typstAction: TypstAction | null;
}

export interface WalkOptions {
  /** Evaluate typst overrides and defaults. Defaults to true. */
  trackTypst?: boolean;
  /** Skip directories whose name starts with `_`. Defaults to true. */
  skipUnderscoreDirs?: boolean;
}

export interface WalkResult {
  files: WalkedFile[];
  ignored: number;
}

function toPosix(value: string): string {
  return value.split(path.sep).join('/');
}

/**
 * Collect the files of one source tree, applying ignore rules and typst
 * actions. Local deploy.toml files are loaded as the walk enters their folder.
 */
export async function walkFiles(
  treeRoot: string,
  config: DeployConfig,
  initialScopes: readonly DeployScope[],
  options: WalkOptions = {},
): Promise<WalkResult> {
  const trackTypst = options.trackTypst ?? true;
  const skipUnderscoreDirs = options.skipUnderscoreDirs ?? true;
  let ignored = 0;

  async function walk(dir: string, scopes: readonly DeployScope[]): Promise<WalkedFile[]> {
    const entries = await readdir(dir, { withFileTypes: true });
    const files: WalkedFile[] = [];

    for (const entry of entries) {
      if (
        entry.name.startsWith('.') ||
        IGNORED_NAMES.has(entry.name) ||
        entry.name === DEPLOY_CONFIG_NAME
      ) {
        continue;
      }

      const fullPath = path.join(dir, entry.name);

      if (entry.isDirectory()) {
        if (skipUnderscoreDirs && entry.name.startsWith('_')) continue;

        const localScope = await loadLocalScope(config, fullPath);
        const childScopes =
          localScope && !scopes.includes(localScope)
            ? [...scopes, localScope]
            : scopes;
        files.push(...(await walk(fullPath, childScopes)));
        continue;
      }

      if (!entry.isFile()) continue;

      const decision = evaluateFile(config, scopes, fullPath, trackTypst);

      if (decision.ignored) {
        ignored += 1;
        continue;
      }

      const extension = path.extname(entry.name).toLowerCase();

      if (trackTypst && extension !== '.typ' && decision.matchedRules.length > 0) {
        const rule = decision.matchedRules[decision.matchedRules.length - 1];
        throw new Error(
          `[deploy] La regola typst "${rule.glob}" (${rule.label}) corrisponde ` +
            `a un file non Typst: ${toPosix(path.relative(config.rootDir, fullPath))}.`,
        );
      }

      files.push({
        absolute: fullPath,
        treeRelative: toPosix(path.relative(treeRoot, fullPath)),
        contentRelative: toPosix(path.relative(config.rawDir, fullPath)),
        typstAction: decision.typstAction,
      });
    }

    return files;
  }

  const files = await walk(treeRoot, initialScopes);
  return { files, ignored };
}

export async function compileTypst(
  source: string,
  destination: string,
  rootDir: string,
): Promise<void> {
  await mkdir(path.dirname(destination), { recursive: true });

  try {
    // Use the repository root as the Typst root so documents can import the
    // shared typst-components submodule with absolute paths.
    await execFileAsync('typst', ['compile', '--root', rootDir, source, destination], {
      cwd: rootDir,
    });
  } catch (error) {
    const failure = error as NodeJS.ErrnoException & {
      stdout?: string;
      stderr?: string;
    };

    if (failure.code === 'ENOENT') {
      throw new Error(
        '[content] Typst non è installato: serve il comando `typst` per compilare i sorgenti .typ. ' +
          'In CI viene installato da typst-community/setup-typst.',
      );
    }

    const details = (failure.stderr || failure.stdout || failure.message).trim();

    throw new Error(
      `[content] Compilazione Typst fallita per ${path.relative(rootDir, source)}` +
        (details ? `:\n${details}` : '.'),
    );
  }
}

export interface PublishResult {
  copied: number;
  compiled: number;
  published: number;
  ignored: number;
  skipped: Set<string>;
}

interface TypstJob {
  source: string;
  destination: string;
}

/**
 * Copy the publishable files of one source tree to its staged destination,
 * compile Typst sources, then publish sources configured with `publish`.
 */
export async function publishTree(
  sourceRoot: string,
  destinationRoot: string,
  config: DeployConfig,
  rootDir: string,
  compile: CompileFn = compileTypst,
): Promise<PublishResult> {
  const initialScopes = await scopesForDir(config, sourceRoot);
  const { files, ignored: ignoredByConfig } = await walkFiles(
    sourceRoot,
    config,
    initialScopes,
  );

  const skipped = new Set<string>();
  const compileJobs: TypstJob[] = [];
  const publishJobs: TypstJob[] = [];
  const generatedDestinations = new Map<string, string>();

  let copied = 0;
  let compiled = 0;
  let published = 0;
  let ignored = ignoredByConfig;

  await mkdir(destinationRoot, { recursive: true });

  for (const file of files) {
    const extension = path.extname(file.absolute).toLowerCase();
    const name = path.basename(file.absolute);

    if (extension === '.typ') {
      const action = file.typstAction ?? config.settings.defaultAction;

      if (action === 'ignore') {
        ignored += 1;
        continue;
      }

      const destinationRelative = typstOutputPath(
        file.treeRelative,
        action,
        config.settings.format,
      );
      const previousSource = generatedDestinations.get(destinationRelative);

      if (previousSource !== undefined) {
        throw new Error(
          `[deploy] Due sorgenti producono lo stesso file "${destinationRelative}": ` +
            `${toPosix(path.relative(rootDir, previousSource))} e ` +
            `${toPosix(path.relative(rootDir, file.absolute))}.`,
        );
      }

      generatedDestinations.set(destinationRelative, file.absolute);

      const job = {
        source: file.absolute,
        destination: path.join(destinationRoot, ...destinationRelative.split('/')),
      };

      if (action === 'compile') compileJobs.push(job);
      else publishJobs.push(job);

      continue;
    }

    if (name.startsWith('_')) continue;

    if (!ALLOWED_EXTENSIONS.has(extension)) {
      skipped.add(extension || '(senza estensione)');
      continue;
    }

    const destination = path.join(destinationRoot, ...file.treeRelative.split('/'));
    await mkdir(path.dirname(destination), { recursive: true });
    await copyFile(file.absolute, destination);
    copied += 1;
  }

  // Compile only after every existing file has been staged, so a compiled PDF
  // replaces an existing PDF with the same name.
  for (const { source, destination } of compileJobs) {
    await compile(source, destination, rootDir);
    compiled += 1;
  }

  // Publish sources only after compiling: when both `name.typ` and
  // `_name.typ` exist, the output is `name.pdf` plus `name.typ`.
  for (const { source, destination } of publishJobs) {
    await mkdir(path.dirname(destination), { recursive: true });
    await copyFile(source, destination);
    published += 1;
  }

  return { copied, compiled, published, ignored, skipped };
}
