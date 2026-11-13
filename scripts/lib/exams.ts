import { readdir, readFile, stat } from 'node:fs/promises';
import path from 'node:path';

const TEST_NAME = /^[A-Za-z0-9][A-Za-z0-9_-]*$/;
const DEFAULT_TESTS_ROOT = '../../../tests';

export interface ExamValidation {
  tests: number;
  manifests: number;
  corrections: number;
}

interface ExamDescriptor {
  version?: unknown;
  sets?: unknown;
  categories?: unknown;
  'preamble-file'?: unknown;
  [key: string]: unknown;
}

interface CategoryDescriptor {
  id?: unknown;
  sets?: unknown;
  intro?: unknown;
  exercises?: unknown;
}

interface ExerciseDescriptor {
  id?: unknown;
  file?: unknown;
  sets?: unknown;
}

function toPosix(value: string): string {
  return value.split(path.sep).join('/');
}

async function fileExists(target: string): Promise<boolean> {
  try {
    return (await stat(target)).isFile();
  } catch {
    return false;
  }
}

async function directoryExists(target: string): Promise<boolean> {
  try {
    return (await stat(target)).isDirectory();
  } catch {
    return false;
  }
}

async function readJson<T>(
  target: string,
  errors: string[],
  label: string,
): Promise<T | null> {
  let raw: string;

  try {
    raw = await readFile(target, 'utf8');
  } catch {
    errors.push(`${label}: file non trovato (${toPosix(target)})`);
    return null;
  }

  try {
    const parsed = JSON.parse(raw);

    if (typeof parsed !== 'object' || parsed === null || Array.isArray(parsed)) {
      errors.push(`${label}: deve contenere un oggetto JSON`);
      return null;
    }

    return parsed as T;
  } catch (error) {
    errors.push(`${label}: JSON non valido (${(error as Error).message})`);
    return null;
  }
}

function stringArray(value: unknown): string[] | null {
  if (!Array.isArray(value) || value.length === 0) {
    return null;
  }

  if (value.some((item) => typeof item !== 'string' || item.length === 0)) {
    return null;
  }

  return value as string[];
}

function categoriesOf(descriptor: ExamDescriptor): CategoryDescriptor[] | null {
  if (!Array.isArray(descriptor.categories) || descriptor.categories.length === 0) {
    return null;
  }

  const categories: CategoryDescriptor[] = [];

  for (const category of descriptor.categories) {
    if (typeof category !== 'object' || category === null || Array.isArray(category)) {
      return null;
    }

    categories.push(category as CategoryDescriptor);
  }

  return categories;
}

function setsOf(value: { sets?: unknown }, fallback: string[]): string[] {
  return stringArray(value.sets) ?? fallback;
}

function exercisesForSet(descriptor: ExamDescriptor, setName: string): string[] | null {
  const sets = stringArray(descriptor.sets);
  const categories = categoriesOf(descriptor);

  if (sets === null || categories === null) {
    return null;
  }

  const ids: string[] = [];

  for (const category of categories) {
    const categorySetList = setsOf(category, sets);

    if (!categorySetList.includes(setName) || !Array.isArray(category.exercises)) {
      return null;
    }

    for (const exercise of category.exercises) {
      if (typeof exercise !== 'object' || exercise === null || Array.isArray(exercise)) {
        return null;
      }

      const typed = exercise as ExerciseDescriptor;

      if (typeof typed.id !== 'string' || typed.id.length === 0) {
        return null;
      }

      if (setsOf(typed, categorySetList).includes(setName)) {
        ids.push(typed.id);
      }
    }
  }

  return ids;
}

async function validateTest(
  testDir: string,
  name: string,
  errors: string[],
): Promise<void> {
  const label = toPosix(testDir);

  if (!TEST_NAME.test(name)) {
    errors.push(`${label}: nome della prova non valido; usa lettere, numeri, trattini e underscore.`);
    return;
  }

  const descriptorPath = path.join(testDir, 'testo', `${name}.json`);
  const testoDir = path.join(testDir, 'testo');

  if (!(await fileExists(descriptorPath))) {
    errors.push(`${label}: manca il descrittore convenzionale testo/${name}.json.`);
    return;
  }

  if (await directoryExists(testoDir)) {
    const typstFiles = (await readdir(testoDir)).filter((file) => file.endsWith('.typ'));

    if (
      !typstFiles.includes(`${name}.typ`) &&
      !typstFiles.some((file) => file.startsWith(`${name}-`))
    ) {
      errors.push(
        `${label}: manca il documento Typst testo/${name}.typ (o testo/${name}-<set>.typ).`,
      );
    }
  }

  const descriptor = await readJson<ExamDescriptor>(
    descriptorPath,
    errors,
    toPosix(descriptorPath),
  );

  if (descriptor === null) {
    return;
  }

  const sets = stringArray(descriptor.sets);
  const categories = categoriesOf(descriptor);

  if (descriptor.version !== 1) {
    errors.push(`${toPosix(descriptorPath)}: "version" deve essere 1.`);
  }

  if (sets === null) {
    errors.push(`${toPosix(descriptorPath)}: "sets" deve essere un array non vuoto di nomi.`);
  }

  if (categories === null) {
    errors.push(`${toPosix(descriptorPath)}: "categories" deve essere un array non vuoto.`);
    return;
  }

  const descriptorDir = path.dirname(descriptorPath);
  const preamble = descriptor['preamble-file'];

  if (typeof preamble === 'string' && preamble.length > 0) {
    if (!(await fileExists(path.resolve(descriptorDir, preamble)))) {
      errors.push(`${toPosix(descriptorPath)}: "preamble-file" non trovato: ${preamble}`);
    }
  }

  const solutionDir = path.join(testDir, 'soluzione');

  if (!(await directoryExists(solutionDir))) {
    errors.push(`${label}: manca la cartella soluzione/.`);
  }

  const solutionStems = (await directoryExists(solutionDir))
    ? new Set(
        (await readdir(solutionDir))
          .filter((file) => !file.startsWith('.'))
          .map((file) => path.parse(file).name),
      )
    : new Set<string>();

  for (const category of categories) {
    if (typeof category.id !== 'string' || category.id.length === 0) {
      errors.push(`${toPosix(descriptorPath)}: una categoria non ha "id".`);
    }

    if (typeof category.intro === 'string' && category.intro.length > 0) {
      if (!(await fileExists(path.resolve(descriptorDir, category.intro)))) {
        errors.push(
          `${toPosix(descriptorPath)}: "intro" della categoria ${String(category.id)} non trovato: ${category.intro}`,
        );
      }
    }

    if (!Array.isArray(category.exercises) || category.exercises.length === 0) {
      errors.push(
        `${toPosix(descriptorPath)}: la categoria ${String(category.id)} non ha esercizi.`,
      );
      continue;
    }

    for (const exercise of category.exercises) {
      if (typeof exercise !== 'object' || exercise === null || Array.isArray(exercise)) {
        errors.push(
          `${toPosix(descriptorPath)}: la categoria ${String(category.id)} contiene un esercizio non valido.`,
        );
        continue;
      }

      const typed = exercise as ExerciseDescriptor;

      if (typeof typed.id !== 'string' || typed.id.length === 0) {
        errors.push(
          `${toPosix(descriptorPath)}: un esercizio della categoria ${String(category.id)} non ha "id".`,
        );
        continue;
      }

      if (typeof typed.file !== 'string' || typed.file.length === 0) {
        errors.push(`${toPosix(descriptorPath)}: l'esercizio ${typed.id} non ha "file".`);
      } else if (!(await fileExists(path.resolve(descriptorDir, typed.file)))) {
        errors.push(
          `${toPosix(descriptorPath)}: file dell'esercizio ${typed.id} non trovato: ${typed.file}`,
        );
      }

      if (!solutionStems.has(typed.id)) {
        errors.push(
          `${label}: manca la soluzione per l'esercizio ${typed.id} in soluzione/${typed.id}.<ext>.`,
        );
      }
    }
  }
}

function resolveInsideRoot(
  rootDir: string,
  baseDir: string,
  value: string,
): string {
  const resolved = value.startsWith('/')
    ? path.join(rootDir, value.slice(1))
    : path.resolve(baseDir, value);

  if (resolved !== rootDir && !resolved.startsWith(`${rootDir}${path.sep}`)) {
    throw new Error(`percorso fuori dal repository: ${value}`);
  }

  return resolved;
}

export async function validateExams(
  contentDir: string,
): Promise<ExamValidation> {
  const errors: string[] = [];
  const rootDir = path.dirname(contentDir);
  const adminDir = path.join(contentDir, 'raw', 'private', 'admin');
  const testsDir = path.join(adminDir, 'tests');
  const correctionsDir = path.join(adminDir, 'corrections');
  const descriptors = new Map<string, ExamDescriptor>();

  let testCount = 0;
  let manifestCount = 0;
  let correctionCount = 0;

  if (!(await directoryExists(adminDir))) {
    return { tests: 0, manifests: 0, corrections: 0 };
  }

  if (!(await directoryExists(testsDir))) {
    throw new Error(`[exams] cartella delle prove non trovata: ${toPosix(testsDir)}`);
  }

  const testEntries = await readdir(testsDir, { withFileTypes: true });

  for (const entry of testEntries.sort((a, b) => a.name.localeCompare(b.name))) {
    if (!entry.isDirectory() || entry.name.startsWith('.')) {
      continue;
    }

    testCount += 1;
    const testDir = path.join(testsDir, entry.name);

    await validateTest(testDir, entry.name, errors);

    const descriptorPath = path.join(testDir, 'testo', `${entry.name}.json`);
    const descriptor = await readJson<ExamDescriptor>(
      descriptorPath,
      [],
      toPosix(descriptorPath),
    );

    if (descriptor !== null) {
      descriptors.set(descriptorPath, descriptor);
    }
  }

  if (!(await directoryExists(correctionsDir))) {
    throw new Error(`[exams] cartella delle correzioni non trovata: ${toPosix(correctionsDir)}`);
  }

  const classEntries = await readdir(correctionsDir, { withFileTypes: true });

  for (const classEntry of classEntries.sort((a, b) => a.name.localeCompare(b.name))) {
    if (!classEntry.isDirectory() || classEntry.name.startsWith('.')) {
      continue;
    }

    const classDir = path.join(correctionsDir, classEntry.name);
    const cohortEntries = await readdir(classDir, { withFileTypes: true });

    for (const cohortEntry of cohortEntries.sort((a, b) => a.name.localeCompare(b.name))) {
      if (!cohortEntry.isDirectory() || cohortEntry.name.startsWith('.')) {
        continue;
      }

      const cohortDir = path.join(classDir, cohortEntry.name);
      const manifestPath = path.join(cohortDir, 'manifest.json');
      const manifest = await readJson<Record<string, unknown>>(
        manifestPath,
        errors,
        toPosix(manifestPath),
      );

      if (manifest === null) {
        continue;
      }

      manifestCount += 1;
      const label = toPosix(manifestPath);

      if (manifest.version !== 1) {
        errors.push(`${label}: "version" deve essere 1.`);
      }

      if (typeof manifest.date !== 'string' || manifest.date.length === 0) {
        errors.push(`${label}: manca "date".`);
      }

      let testsRoot: string | null = null;
      let defaultTestPath: string | null = null;
      const testName = manifest.test;
      const legacyPath = manifest['test-json'];

      if (typeof testName === 'string' && testName.length > 0) {
        if (!TEST_NAME.test(testName)) {
          errors.push(`${label}: nome della prova non valido: "${testName}".`);
        }

        const testsRootValue = manifest['tests-root'];
        const testsRootRaw =
          typeof testsRootValue === 'string' && testsRootValue.length > 0
            ? testsRootValue
            : DEFAULT_TESTS_ROOT;

        try {
          testsRoot = resolveInsideRoot(rootDir, cohortDir, testsRootRaw);
          defaultTestPath = path.join(testsRoot, testName, 'testo', `${testName}.json`);
        } catch (error) {
          errors.push(`${label}: ${(error as Error).message}`);
        }

        if (defaultTestPath !== null && !(await fileExists(defaultTestPath))) {
          errors.push(
            `${label}: prova "${testName}" non trovata (${toPosix(defaultTestPath)}).`,
          );
          defaultTestPath = null;
        }
      } else if (typeof legacyPath === 'string' && legacyPath.length > 0) {
        try {
          defaultTestPath = resolveInsideRoot(rootDir, cohortDir, legacyPath);
        } catch (error) {
          errors.push(`${label}: ${(error as Error).message}`);
        }

        if (defaultTestPath !== null && !(await fileExists(defaultTestPath))) {
          errors.push(`${label}: test-json non trovato (${toPosix(defaultTestPath)}).`);
          defaultTestPath = null;
        }
      } else {
        errors.push(`${label}: manca "test" (o il legacy "test-json").`);
      }

      if (defaultTestPath !== null && !descriptors.has(defaultTestPath)) {
        const loaded = await readJson<ExamDescriptor>(
          defaultTestPath,
          errors,
          toPosix(defaultTestPath),
        );

        if (loaded !== null) {
          descriptors.set(defaultTestPath, loaded);
        }
      }

      const cohortCorrections = path.join(cohortDir, 'correzioni');

      if (!(await directoryExists(cohortCorrections))) {
        errors.push(`${toPosix(cohortDir)}: manca la cartella correzioni/.`);
        continue;
      }

      const correctionEntries = await readdir(cohortCorrections, { withFileTypes: true });

      for (const correctionEntry of correctionEntries.sort((a, b) => a.name.localeCompare(b.name))) {
        if (
          !correctionEntry.isFile() ||
          !correctionEntry.name.endsWith('.json') ||
          correctionEntry.name.startsWith('.')
        ) {
          continue;
        }

        correctionCount += 1;
        const correctionPath = path.join(cohortCorrections, correctionEntry.name);
        const correction = await readJson<Record<string, unknown>>(
          correctionPath,
          errors,
          toPosix(correctionPath),
        );

        if (correction === null || correction.absent === true) {
          continue;
        }

        const correctionLabel = toPosix(correctionPath);
        let effectiveTestPath = defaultTestPath;
        const override = correction.test;

        if (override !== undefined) {
          if (typeof override !== 'string' || !TEST_NAME.test(override)) {
            errors.push(`${correctionLabel}: "test" non valido.`);
            continue;
          }

          if (testsRoot === null) {
            errors.push(
              `${correctionLabel}: impossibile risolvere "test" senza un "tests-root" (manifest legacy?)`,
            );
            continue;
          }

          effectiveTestPath = path.join(testsRoot, override, 'testo', `${override}.json`);

          if (!(await fileExists(effectiveTestPath))) {
            errors.push(`${correctionLabel}: prova "${override}" non trovata.`);
            continue;
          }

          if (!descriptors.has(effectiveTestPath)) {
            const loaded = await readJson<ExamDescriptor>(
              effectiveTestPath,
              errors,
              toPosix(effectiveTestPath),
            );

            if (loaded !== null) {
              descriptors.set(effectiveTestPath, loaded);
            }
          }
        }

        if (effectiveTestPath === null) {
          continue;
        }

        const descriptor = descriptors.get(effectiveTestPath) ?? null;

        if (descriptor === null) {
          continue;
        }

        const setName = correction.set;

        if (typeof setName !== 'string' || setName.length === 0) {
          errors.push(`${correctionLabel}: manca "set".`);
          continue;
        }

        const expected = exercisesForSet(descriptor, setName);

        if (expected === null) {
          errors.push(`${correctionLabel}: set "${setName}" non valido per la prova.`);
          continue;
        }

        const exercises = correction.exercises;

        if (typeof exercises !== 'object' || exercises === null || Array.isArray(exercises)) {
          errors.push(`${correctionLabel}: "exercises" deve essere un oggetto.`);
          continue;
        }

        const actual = Object.keys(exercises as Record<string, unknown>);

        for (const id of actual) {
          if (!expected.includes(id)) {
            errors.push(`${correctionLabel}: esercizio "${id}" assente dal set "${setName}".`);
          }
        }

        for (const id of expected) {
          if (!actual.includes(id)) {
            errors.push(
              `${correctionLabel}: manca l'esercizio "${id}" (usa null se non consegnato).`,
            );
          }
        }
      }
    }
  }

  if (errors.length > 0) {
    throw new Error(`[exams] ${errors.length} problema/i:\n- ${errors.join('\n- ')}`);
  }

  return { tests: testCount, manifests: manifestCount, corrections: correctionCount };
}
