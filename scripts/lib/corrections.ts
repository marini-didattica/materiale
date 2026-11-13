import { mkdir, readdir, readFile, rm, stat, writeFile } from 'node:fs/promises';
import path from 'node:path';
import type { Students } from '../../src/types';
import type { CompileFn } from './content-publisher';

export interface CorrectionPublishResult {
  cohorts: number;
  compiled: number;
}

export interface CorrectionPublishOptions {
  contentDir: string;
  rootDir: string;
  stagedPrivateDir: string;
  students: Students;
  compile: CompileFn;
}

interface CohortManifest {
  publish?: unknown;
  [key: string]: unknown;
}

function typstString(value: string): string {
  return value.replace(/\\/g, '\\\\').replace(/"/g, '\\"');
}

async function directoryExists(target: string): Promise<boolean> {
  try {
    return (await stat(target)).isDirectory();
  } catch {
    return false;
  }
}

/**
 * Generate the correction PDFs of every cohort whose manifest sets
 * `publish: true`. The student folders no longer carry a `correzione.typ`
 * stub: the correction descriptor is derived from the cohort path and the
 * student file name, and compiled from a temporary source.
 */
export async function publishCorrections(
  options: CorrectionPublishOptions,
): Promise<CorrectionPublishResult> {
  const { contentDir, rootDir, stagedPrivateDir, students, compile } = options;
  const correctionsDir = path.join(contentDir, 'raw', 'private', 'admin', 'corrections');

  if (!(await directoryExists(correctionsDir))) {
    return { cohorts: 0, compiled: 0 };
  }

  const tempRoot = path.join(path.dirname(stagedPrivateDir), '.correzioni-src');
  await rm(tempRoot, { recursive: true, force: true });
  await mkdir(tempRoot, { recursive: true });

  let cohorts = 0;
  let compiled = 0;

  try {
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
        let manifest: CohortManifest;

        try {
          manifest = JSON.parse(await readFile(manifestPath, 'utf8')) as CohortManifest;
        } catch (error) {
          throw new Error(
            `[corrections] manifest non leggibile: ${path.relative(rootDir, manifestPath)} ` +
              `(${(error as Error).message})`,
          );
        }

        if (manifest.publish !== true) {
          continue;
        }

        cohorts += 1;
        const correctionsPath = path.join(cohortDir, 'correzioni');

        if (!(await directoryExists(correctionsPath))) {
          throw new Error(
            `[corrections] ${path.relative(rootDir, cohortDir)}: publish è true ma manca correzioni/.`,
          );
        }

        const correctionEntries = await readdir(correctionsPath, { withFileTypes: true });

        for (const correctionEntry of correctionEntries.sort((a, b) => a.name.localeCompare(b.name))) {
          if (
            !correctionEntry.isFile() ||
            !correctionEntry.name.endsWith('.json') ||
            correctionEntry.name.startsWith('.')
          ) {
            continue;
          }

          const correctionPath = path.join(correctionsPath, correctionEntry.name);
          let correction: Record<string, unknown>;

          try {
            correction = JSON.parse(await readFile(correctionPath, 'utf8')) as Record<string, unknown>;
          } catch (error) {
            throw new Error(
              `[corrections] JSON non valido: ${path.relative(rootDir, correctionPath)} ` +
                `(${(error as Error).message})`,
            );
          }

          if (correction.absent === true) {
            continue;
          }

          const student = path.parse(correctionEntry.name).name;
          const rosterKey = `${classEntry.name}/${student}`;
          const record = students[rosterKey];

          if (record === undefined) {
            throw new Error(
              `[corrections] ${path.relative(rootDir, correctionPath)}: ` +
                `studente "${rosterKey}" non presente in content/students.json.`,
            );
          }

          const adminPath =
            `/content/raw/private/admin/corrections/${classEntry.name}/` +
            `${cohortEntry.name}/correzioni/${student}.json`;
          const source = path.join(
            tempRoot,
            `${classEntry.name}-${cohortEntry.name}-${student}.typ`,
          );
          const destination = path.join(
            stagedPrivateDir,
            record.slug,
            cohortEntry.name,
            'correzione.pdf',
          );

          await writeFile(
            source,
            '#import "/typst-components/src/lib.typ": render-correction\n\n' +
              `#render-correction("${typstString(adminPath)}")\n`,
            'utf8',
          );

          await compile(source, destination, rootDir);
          compiled += 1;
        }
      }
    }
  } finally {
    await rm(tempRoot, { recursive: true, force: true });
  }

  return { cohorts, compiled };
}
