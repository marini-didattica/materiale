import { execFile } from 'node:child_process';
import { copyFile, mkdir, readFile, readdir, rm, stat } from 'node:fs/promises';
import path from 'node:path';
import { promisify } from 'node:util';
import { studentOwnerSlug } from '../src/lib/students';
import type { Students } from '../src/types';

const execFileAsync = promisify(execFile);

const root = process.cwd();
const contentDir = path.join(root, 'content');
const rawDir = path.join(contentDir, 'raw');
const publicSourceDir = path.join(rawDir, 'public');
const privateSourceDir = path.join(rawDir, 'private');
const studentsPath = path.join(contentDir, 'students.json');
const stagedRawDir = path.join(root, 'static', 'raw');
const stagedPublicDir = path.join(stagedRawDir, 'public');
const stagedPrivateDir = path.join(stagedRawDir, 'private');

/** Keep in sync with the main site's access form. */
const CODE_PATTERN = /^[A-Z0-9]{8}$/;
const OWNER_SLUG_PATTERN = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;

/**
 * Extensions that are safe to publish as-is.
 *
 * Typst sources are handled separately: every `.typ` file is compiled to PDF
 * during the content build. A `.typ` file whose name starts with `_` is not
 * compiled and is published with the underscore removed instead. Other source
 * files (`.tex`), LaTeX build artifacts and anything that can execute in the
 * browser (`.html`, `.js`) are deliberately excluded.
 */
const ALLOWED_EXTENSIONS = new Set([
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

const IGNORED_NAMES = new Set(['.DS_Store', 'Thumbs.db', '__pycache__']);

function fail(message: string): never {
  throw new Error(`[content] ${message}`);
}

async function readStudents(): Promise<Students> {
  let raw: string;

  try {
    raw = await readFile(studentsPath, 'utf8');
  } catch {
    fail('content/students.json non trovato.');
  }

  let parsed: unknown;

  try {
    parsed = JSON.parse(raw);
  } catch (error) {
    fail(`content/students.json non è JSON valido: ${(error as Error).message}`);
  }

  if (typeof parsed !== 'object' || parsed === null || Array.isArray(parsed)) {
    fail('content/students.json deve contenere un oggetto { "cartella": { ... } }.');
  }

  return parsed as Students;
}

function assertFolderPath(folder: string) {
  if (!folder || folder === '.' || folder === '..') {
    fail('Ogni voce di students.json deve indicare una cartella non vuota.');
  }

  if (folder.includes('\\') || path.isAbsolute(folder)) {
    fail(`La cartella "${folder}" deve essere un percorso relativo sotto content/raw/private/.`);
  }

  const segments = folder.split('/');

  if (
    segments.some(
      (segment) =>
        !segment ||
        segment === '.' ||
        segment === '..' ||
        segment.startsWith('.') ||
        segment.startsWith('_'),
    )
  ) {
    fail(`La cartella "${folder}" non è un percorso relativo valido sotto content/raw/private/.`);
  }

  const resolved = path.resolve(privateSourceDir, folder);

  if (resolved !== privateSourceDir && !resolved.startsWith(`${privateSourceDir}${path.sep}`)) {
    fail(`La cartella "${folder}" esce da content/raw/private/.`);
  }
}

function validateNameArray(field: string, value: unknown, folder: string) {
  if (!Array.isArray(value) || value.length === 0) {
    fail(`La voce "${folder}" deve avere "${field}" come array non vuoto di nomi.`);
  }

  for (const name of value) {
    if (typeof name !== 'string' || name.trim() === '') {
      fail(`Ogni valore di "${field}" della cartella "${folder}" deve essere una stringa non vuota.`);
    }

    if (/\s/.test(name)) {
      fail(
        `I valori di "${field}" della cartella "${folder}" non possono contenere spazi: ` +
          'usa un elemento per ogni nome.',
      );
    }
  }
}

async function validateStudents(students: Students) {
  const folders = Object.keys(students);
  const slugs = new Set<string>();
  const ownerSlugs = new Set<string>();

  for (const [folder, student] of Object.entries(students)) {
    assertFolderPath(folder);

    if (typeof student !== 'object' || student === null || Array.isArray(student)) {
      fail(
        `La voce "${folder}" deve essere un oggetto con slug, ` +
          'owner-first-names e owner-last-names.',
      );
    }

    if (typeof student.slug !== 'string' || !CODE_PATTERN.test(student.slug)) {
      fail(
        `Lo slug della cartella "${folder}" non è valido: servono 8 caratteri ` +
          'alfanumerici maiuscoli (A-Z, 0-9).',
      );
    }

    if (slugs.has(student.slug)) {
      fail(`Lo slug "${student.slug}" è associato a più di una cartella.`);
    }

    slugs.add(student.slug);

    validateNameArray('owner-first-names', student['owner-first-names'], folder);
    validateNameArray('owner-last-names', student['owner-last-names'], folder);

    if (student['owner-slug'] !== undefined && typeof student['owner-slug'] !== 'string') {
      fail(`"owner-slug" della cartella "${folder}" deve essere una stringa.`);
    }

    const ownerSlug = studentOwnerSlug(student);

    if (!OWNER_SLUG_PATTERN.test(ownerSlug)) {
      fail(
        `L'owner-slug della cartella "${folder}" non è valido: usa lettere minuscole, ` +
          'numeri e trattini (es. "billy-jane"). Se lo ometti viene calcolato da nomi e cognomi.',
      );
    }

    if (ownerSlugs.has(ownerSlug)) {
      fail(`L'owner-slug "${ownerSlug}" è associato a più di una cartella.`);
    }

    ownerSlugs.add(ownerSlug);

    const source = path.join(privateSourceDir, folder);

    try {
      const info = await stat(source);

      if (!info.isDirectory()) {
        fail(`"${source}" non è una cartella.`);
      }
    } catch {
      fail(`La cartella "content/raw/private/${folder}" indicata in students.json non esiste.`);
    }
  }

  for (let i = 0; i < folders.length; i += 1) {
    for (let j = i + 1; j < folders.length; j += 1) {
      const first = folders[i];
      const second = folders[j];

      if (first.startsWith(`${second}/`) || second.startsWith(`${first}/`)) {
        fail(`Le cartelle "${first}" e "${second}" si sovrappongono.`);
      }
    }
  }
}

/**
 * Every published file under raw/private must belong to a student entry point
 * listed in students.json. This catches material added to the wrong folder or a
 * new student folder whose students.json entry was forgotten.
 */
async function validateNoUnlistedFiles(students: Students) {
  const folders = Object.keys(students);

  async function walk(dir: string) {
    const entries = await readdir(dir, { withFileTypes: true });

    for (const entry of entries) {
      if (entry.name.startsWith('.') || IGNORED_NAMES.has(entry.name)) continue;

      const fullPath = path.join(dir, entry.name);
      const relative = path.relative(privateSourceDir, fullPath).split(path.sep).join('/');

      if (entry.isDirectory()) {
        await walk(fullPath);
        continue;
      }

      if (!entry.isFile()) continue;

      const listed = folders.some(
        (folder) => relative === folder || relative.startsWith(`${folder}/`),
      );

      if (!listed) {
        fail(
          `Il file "content/raw/private/${relative}" non appartiene a nessuna cartella ` +
            'elencata in content/students.json.',
        );
      }
    }
  }

  await walk(privateSourceDir);
}

async function collectFiles(dir: string): Promise<string[]> {
  const entries = await readdir(dir, { withFileTypes: true });
  const files: string[] = [];

  for (const entry of entries) {
    if (entry.name.startsWith('.') || IGNORED_NAMES.has(entry.name)) {
      continue;
    }

    const fullPath = path.join(dir, entry.name);

    if (entry.isDirectory()) {
      if (entry.name.startsWith('_')) continue;

      files.push(...(await collectFiles(fullPath)));
    } else if (entry.isFile()) {
      // Files starting with `_` are collected: `_name.typ` is a source file
      // that must be published as `name.typ` after the compilation step.
      files.push(fullPath);
    }
  }

  return files;
}

async function compileTypst(source: string, destination: string) {
  await mkdir(path.dirname(destination), { recursive: true });

  try {
    // Use the repository root as the Typst root so documents can import the
    // shared typst-theme and typst-components submodules with absolute paths.
    await execFileAsync('typst', ['compile', '--root', root, source, destination], {
      cwd: root,
    });
  } catch (error) {
    const failure = error as NodeJS.ErrnoException & {
      stdout?: string;
      stderr?: string;
    };

    if (failure.code === 'ENOENT') {
      fail(
        'Typst non è installato: serve il comando `typst` per compilare i sorgenti .typ. ' +
          'In CI viene installato da typst-community/setup-typst.',
      );
    }

    const details = (failure.stderr || failure.stdout || failure.message).trim();

    fail(
      `Compilazione Typst fallita per ${path.relative(root, source)}` +
        (details ? `:\n${details}` : '.'),
    );
  }
}

interface PublishResult {
  copied: number;
  compiled: number;
  published: number;
  skipped: Set<string>;
}

/**
 * Copy the publishable files of one source tree to its staged destination,
 * compile Typst sources to PDF, then publish `_name.typ` sources.
 */
async function publishTree(sourceRoot: string, destinationRoot: string): Promise<PublishResult> {
  const files = await collectFiles(sourceRoot);
  const skipped = new Set<string>();
  const compileJobs: Array<{ source: string; destination: string }> = [];
  const publishJobs: Array<{ source: string; destination: string }> = [];

  let copied = 0;
  let compiled = 0;
  let published = 0;

  await mkdir(destinationRoot, { recursive: true });

  for (const source of files) {
    const extension = path.extname(source).toLowerCase();
    const name = path.basename(source);
    const relative = path.relative(sourceRoot, source);

    if (extension === '.typ') {
      if (name.startsWith('_')) {
        // Escape hatch: `_name.typ` is not compiled and is published as
        // `name.typ`. Queued for after the compilation pass.
        publishJobs.push({
          source,
          destination: path.join(destinationRoot, path.dirname(relative), name.slice(1)),
        });
      } else {
        compileJobs.push({
          source,
          destination: path.join(destinationRoot, `${relative.slice(0, -extension.length)}.pdf`),
        });
      }

      continue;
    }

    if (name.startsWith('_')) {
      continue;
    }

    if (!ALLOWED_EXTENSIONS.has(extension)) {
      skipped.add(extension || '(senza estensione)');
      continue;
    }

    const destination = path.join(destinationRoot, relative);

    await mkdir(path.dirname(destination), { recursive: true });
    await copyFile(source, destination);
    copied += 1;
  }

  // Compile only after every existing file has been staged, so a compiled PDF
  // replaces an existing PDF with the same name.
  for (const { source, destination } of compileJobs) {
    await compileTypst(source, destination);
    compiled += 1;
  }

  // Publish `_name.typ` only after compiling: when both `name.typ` and
  // `_name.typ` exist, the output is `name.pdf` plus `name.typ`.
  for (const { source, destination } of publishJobs) {
    await mkdir(path.dirname(destination), { recursive: true });
    await copyFile(source, destination);
    published += 1;
  }

  return { copied, compiled, published, skipped };
}

async function buildContent() {
  const students = await readStudents();
  await validateStudents(students);
  await validateNoUnlistedFiles(students);

  await rm(stagedRawDir, { recursive: true, force: true });
  await mkdir(stagedPublicDir, { recursive: true });
  await mkdir(stagedPrivateDir, { recursive: true });

  const skipped = new Set<string>();
  const publicResult = await publishTree(publicSourceDir, stagedPublicDir);

  for (const extension of publicResult.skipped) skipped.add(extension);

  console.log(
    `[content] public -> content/raw/public -> static/raw/public ` +
      `(${publicResult.copied} copiati, ${publicResult.compiled} PDF compilati, ` +
      `${publicResult.published} sorgenti .typ pubblicati)`,
  );

  for (const [folder, student] of Object.entries(students)) {
    const sourceRoot = path.join(privateSourceDir, folder);
    const destinationRoot = path.join(stagedPrivateDir, student.slug);
    const result = await publishTree(sourceRoot, destinationRoot);

    for (const extension of result.skipped) skipped.add(extension);

    console.log(
      `[content] ${student.slug} -> content/raw/private/${folder} ` +
        `-> static/raw/private/${student.slug} ` +
        `(${result.copied} copiati, ${result.compiled} PDF compilati, ` +
        `${result.published} sorgenti .typ pubblicati)`,
    );
  }

  if (skipped.size > 0) {
    console.log(
      `[content] Estensioni ignorate: ${[...skipped].sort().join(', ')}. ` +
        'I sorgenti e i file non elencati non vengono pubblicati.',
    );
  }

  console.log('[content] Contenuto pronto in static/raw/.');
}

await buildContent();
