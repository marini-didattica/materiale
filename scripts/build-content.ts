import { mkdir, readFile, rm, stat } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import {
  assertAllTypstRulesUsed,
  loadDeployConfig,
  scopesForDir,
} from './lib/deploy-config';
import { publishTree, walkFiles } from './lib/content-publisher';
import { validateExams } from './lib/exams';
import { studentOwnerSlug } from '../src/lib/students';
import type { Students } from '../src/types';

/** Keep in sync with the main site's access form. */
const CODE_PATTERN = /^[A-Z0-9]{8}$/;
const OWNER_SLUG_PATTERN = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;

function fail(message: string): never {
  throw new Error(`[content] ${message}`);
}

async function readStudents(studentsPath: string): Promise<Students> {
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

function assertFolderPath(folder: string, privateSourceDir: string) {
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

async function validateStudents(students: Students, privateSourceDir: string) {
  const folders = Object.keys(students);
  const slugs = new Set<string>();
  const ownerSlugs = new Set<string>();

  for (const [folder, student] of Object.entries(students)) {
    assertFolderPath(folder, privateSourceDir);

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
 * Every deployed file under raw/private must belong to a student entry point
 * listed in students.json. Files excluded by deploy.toml are not checked.
 */
async function validateNoUnlistedFiles(
  students: Students,
  config: Awaited<ReturnType<typeof loadDeployConfig>>,
  privateSourceDir: string,
) {
  const folders = Object.keys(students);
  const scopes = await scopesForDir(config, privateSourceDir);
  const { files } = await walkFiles(privateSourceDir, config, scopes, {
    trackTypst: false,
    skipUnderscoreDirs: true,
  });

  for (const file of files) {
    const relative = path
      .relative(privateSourceDir, file.absolute)
      .split(path.sep)
      .join('/');

    const listed = folders.some(
      (folder) => relative === folder || relative.startsWith(`${folder}/`),
    );

    if (!listed) {
      fail(
        `Il file "content/raw/private/${relative}" non appartiene a nessuna cartella ` +
          'elencata in content/students.json. Aggiungi la cartella oppure escludilo con deploy.toml.',
      );
    }
  }
}

export interface BuildOptions {
  /** Injectable for tests; defaults to the real `typst compile` command. */
  compile?: Parameters<typeof publishTree>[4];
}

export async function buildContent(
  rootDir = process.cwd(),
  options: BuildOptions = {},
): Promise<void> {
  const contentDir = path.join(rootDir, 'content');
  const rawDir = path.join(contentDir, 'raw');
  const publicSourceDir = path.join(rawDir, 'public');
  const privateSourceDir = path.join(rawDir, 'private');
  const studentsPath = path.join(contentDir, 'students.json');
  const stagedRawDir = path.join(rootDir, 'static', 'raw');
  const stagedPublicDir = path.join(stagedRawDir, 'public');
  const stagedPrivateDir = path.join(stagedRawDir, 'private');
  const config = await loadDeployConfig(rootDir);

  console.log(
    `[deploy] ${config.rootScope.label}: compilazione predefinita "${config.settings.defaultAction}", ` +
      `sorgenti \`_\` "${config.settings.underscoreAction}".`,
  );

  const students = await readStudents(studentsPath);
  await validateStudents(students, privateSourceDir);

  const exams = await validateExams(contentDir);
  console.log(
    `[exams] ${exams.tests} prove, ${exams.manifests} manifest, ` +
      `${exams.corrections} correzioni verificate.`,
  );

  await validateNoUnlistedFiles(students, config, privateSourceDir);

  await rm(stagedRawDir, { recursive: true, force: true });
  await mkdir(stagedPublicDir, { recursive: true });
  await mkdir(stagedPrivateDir, { recursive: true });

  const skipped = new Set<string>();
  const publicResult = await publishTree(
    publicSourceDir,
    stagedPublicDir,
    config,
    rootDir,
    options.compile,
  );

  for (const extension of publicResult.skipped) skipped.add(extension);

  console.log(
    `[content] public -> content/raw/public -> static/raw/public ` +
      `(${publicResult.copied} copiati, ${publicResult.compiled} PDF compilati, ` +
      `${publicResult.published} sorgenti .typ pubblicati, ${publicResult.ignored} ignorati)`,
  );

  for (const [folder, student] of Object.entries(students)) {
    const sourceRoot = path.join(privateSourceDir, folder);
    const destinationRoot = path.join(stagedPrivateDir, student.slug);
    const result = await publishTree(
      sourceRoot,
      destinationRoot,
      config,
      rootDir,
      options.compile,
    );

    for (const extension of result.skipped) skipped.add(extension);

    console.log(
      `[content] ${student.slug} -> content/raw/private/${folder} ` +
        `-> static/raw/private/${student.slug} ` +
        `(${result.copied} copiati, ${result.compiled} PDF compilati, ` +
        `${result.published} sorgenti .typ pubblicati, ${result.ignored} ignorati)`,
    );
  }

  assertAllTypstRulesUsed(config);

  if (skipped.size > 0) {
    console.log(
      `[content] Estensioni ignorate: ${[...skipped].sort().join(', ')}. ` +
        'I sorgenti e i file non elencati non vengono pubblicati.',
    );
  }

  console.log('[content] Contenuto pronto in static/raw/.');
}

const invokedDirectly =
  process.argv[1] !== undefined &&
  path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);

if (invokedDirectly) {
  await buildContent();
}
