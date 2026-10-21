import fs from 'node:fs/promises';
import path from 'node:path';
import type {
  DownloadFile,
  DownloadTree,
  FileEntry,
  StudentRecord,
  Students,
} from '@/types';
import { withBase } from '@/utils/base';
import { encodePath, joinPath } from '@/utils/paths';

const STUDENTS_PATH = 'content/students.json';
const STAGED_PUBLIC_DIR = 'static/raw/public';
const STAGED_PRIVATE_DIR = 'static/raw/private';

const collator = new Intl.Collator('it', { numeric: true, sensitivity: 'base' });

export interface PublicDirectoryPageProps {
  entries: FileEntry[];
  /** Relative directory path, empty string for the browser root. */
  dir: string;
  /** Files to download for this directory and each descendant directory. */
  downloadTree: DownloadTree;
}

export interface PrivateDirectoryPageProps extends PublicDirectoryPageProps {
  student: StudentRecord;
}

export interface PublicDirectoryPage {
  params: { path?: string };
  props: PublicDirectoryPageProps;
}

export interface PrivateDirectoryPage {
  params: { code: string; path?: string };
  props: PrivateDirectoryPageProps;
}

interface BrowserConfig {
  /** Staged raw directory that is browsed. */
  sourceRoot: string;
  /** URL prefix of the generated directory pages, e.g. "/public". */
  pageBase: string;
  /** URL prefix of the raw files, e.g. "/raw/public". */
  fileBase: string;
}

/** Join a URL prefix and a relative path, optionally with a trailing slash. */
function withPath(base: string, relative: string, directory = false): string {
  const normalized = `${base.replace(/\/+$/, '')}/${encodePath(relative)}`.replace(/\/+$/, '');
  return withBase(`${normalized}${directory ? '/' : ''}`);
}

async function walkDirectories(root: string, relative = ''): Promise<string[]> {
  const directories = [relative];
  const entries = await fs.readdir(path.join(root, relative), { withFileTypes: true });

  for (const entry of entries) {
    if (!entry.isDirectory() || entry.name.startsWith('.')) continue;

    const child = joinPath(relative, entry.name);
    directories.push(...(await walkDirectories(root, child)));
  }

  return directories;
}

async function listEntries(
  root: string,
  relative: string,
  config: BrowserConfig,
): Promise<FileEntry[]> {
  const entries = await fs.readdir(path.join(root, relative), { withFileTypes: true });
  const result: FileEntry[] = [];

  for (const entry of entries) {
    if (entry.name.startsWith('.')) continue;

    const child = joinPath(relative, entry.name);

    if (entry.isDirectory()) {
      result.push({
        name: entry.name,
        kind: 'directory',
        size: null,
        extension: null,
        href: withPath(config.pageBase, child, true),
        downloadKey: entry.name,
      });
      continue;
    }

    if (!entry.isFile()) continue;

    const info = await fs.stat(path.join(root, child));
    const extension = path.extname(entry.name).slice(1).toLowerCase();

    result.push({
      name: entry.name,
      kind: 'file',
      size: info.size,
      extension: extension || null,
      href: withPath(config.fileBase, child),
    });
  }

  result.sort((a, b) => {
    if (a.kind !== b.kind) return a.kind === 'directory' ? -1 : 1;
    return collator.compare(a.name, b.name);
  });

  return result;
}

async function collectDownloadFiles(
  root: string,
  relativeDir: string,
  config: BrowserConfig,
): Promise<DownloadFile[]> {
  const baseDir = path.join(root, relativeDir);
  const files: DownloadFile[] = [];

  async function walk(currentDir: string, relative: string) {
    const entries = await fs.readdir(currentDir, { withFileTypes: true });

    for (const entry of entries) {
      if (entry.name.startsWith('.')) continue;

      const fullPath = path.join(currentDir, entry.name);
      const child = joinPath(relative, entry.name);

      if (entry.isDirectory()) {
        await walk(fullPath, child);
        continue;
      }

      if (!entry.isFile()) continue;

      const info = await fs.stat(fullPath);

      files.push({
        name: child,
        href: withPath(config.fileBase, joinPath(relativeDir, child)),
        size: info.size,
      });
    }
  }

  await walk(baseDir, '');
  files.sort((a, b) => collator.compare(a.name, b.name));

  return files;
}

async function collectDownloadTree(
  root: string,
  currentDir: string,
  config: BrowserConfig,
): Promise<DownloadTree> {
  const relativeDirs = await walkDirectories(path.join(root, currentDir));
  const tree: DownloadTree = {};

  for (const relative of relativeDirs) {
    tree[relative] = await collectDownloadFiles(
      root,
      joinPath(currentDir, relative),
      config,
    );
  }

  return tree;
}

function dropEmptyDownloadKeys(entries: FileEntry[], downloadTree: DownloadTree) {
  for (const entry of entries) {
    if (
      entry.kind === 'directory' &&
      entry.downloadKey &&
      (downloadTree[entry.downloadKey]?.length ?? 0) === 0
    ) {
      entry.downloadKey = undefined;
    }
  }
}

async function ensureStagedRoot(root: string, hint: string) {
  try {
    await fs.access(root);
  } catch {
    throw new Error(`${hint} Esegui \`bun run content:build\` prima della build.`);
  }
}

async function buildPages(
  config: BrowserConfig,
): Promise<Array<{ dir: string; entries: FileEntry[]; downloadTree: DownloadTree }>> {
  const directories = await walkDirectories(config.sourceRoot);
  const pages: Array<{ dir: string; entries: FileEntry[]; downloadTree: DownloadTree }> = [];

  for (const dir of directories) {
    const entries = await listEntries(config.sourceRoot, dir, config);
    const downloadTree = await collectDownloadTree(config.sourceRoot, dir, config);

    dropEmptyDownloadKeys(entries, downloadTree);

    pages.push({ dir, entries, downloadTree });
  }

  return pages;
}

/** Build one static page per directory under static/raw/public. */
export async function getPublicDirectoryPages(): Promise<PublicDirectoryPage[]> {
  await ensureStagedRoot(
    STAGED_PUBLIC_DIR,
    'La cartella pubblica non esiste: `static/raw/public`.',
  );

  const config: BrowserConfig = {
    sourceRoot: STAGED_PUBLIC_DIR,
    pageBase: '/public',
    fileBase: '/raw/public',
  };

  const pages = await buildPages(config);

  return pages.map(({ dir, entries, downloadTree }) => ({
    params: { path: dir === '' ? undefined : dir },
    props: { entries, dir, downloadTree },
  }));
}

/**
 * Build one static page per directory in every student's staged content.
 * The student folder is replaced by its access code in the URL, so pages and
 * raw files both live under /private/<code>/.
 */
export async function getPrivateDirectoryPages(): Promise<PrivateDirectoryPage[]> {
  let students: Students;

  try {
    students = JSON.parse(await fs.readFile(STUDENTS_PATH, 'utf8')) as Students;
  } catch {
    throw new Error(
      'Impossibile leggere content/students.json. Esegui `bun run content:build` prima della build.',
    );
  }

  const pages: PrivateDirectoryPage[] = [];

  for (const [folder, student] of Object.entries(students)) {
    const code = student.slug;
    const sourceRoot = path.join(STAGED_PRIVATE_DIR, code);

    await ensureStagedRoot(
      sourceRoot,
      `La cartella pubblica per il codice ${code} (${folder}) non esiste.`,
    );

    const config: BrowserConfig = {
      sourceRoot,
      pageBase: `/private/${code}`,
      fileBase: `/raw/private/${code}`,
    };

    const studentPages = await buildPages(config);

    for (const { dir, entries, downloadTree } of studentPages) {
      pages.push({
        params: { code, path: dir === '' ? undefined : dir },
        props: { entries, dir, student, downloadTree },
      });
    }
  }

  return pages;
}
