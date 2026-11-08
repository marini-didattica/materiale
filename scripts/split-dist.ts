import { access, cp, readFile, rm } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import type { Students } from '../src/types';

/**
 * Split Astro's single `dist/` into the two Cloudflare Pages deployments:
 *
 *   dist-public/  public browser, student browsers, public/private raw files
 *   dist-admin/   everything above plus the admin browser and staff files
 *
 * The admin deployment additionally gets `_worker.js`, which enforces HTTP
 * Basic authentication for the whole hostname. The public deployment must
 * never contain `/admin`, a staff slug's raw tree, or the admin worker.
 */

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const DIST = path.join(ROOT, 'dist');
const PUBLIC_DIST = path.join(ROOT, 'dist-public');
const ADMIN_DIST = path.join(ROOT, 'dist-admin');
const STUDENTS_PATH = path.join(ROOT, 'content', 'students.json');
const ADMIN_WORKER = path.join(ROOT, 'deploy', 'admin', '_worker.js');

async function main(): Promise<void> {
  try {
    await access(DIST);
  } catch {
    throw new Error('[split] manca dist/. Esegui prima `astro build`.');
  }

  const students = JSON.parse(await readFile(STUDENTS_PATH, 'utf8')) as Students;
  const staffSlugs = Object.values(students)
    .filter((student) => student.staff === true)
    .map((student) => student.slug);

  await rm(PUBLIC_DIST, { recursive: true, force: true });
  await rm(ADMIN_DIST, { recursive: true, force: true });

  await cp(DIST, PUBLIC_DIST, { recursive: true });
  await cp(DIST, ADMIN_DIST, { recursive: true });

  // The public deployment keeps only public and student material.
  await rm(path.join(PUBLIC_DIST, 'admin'), { recursive: true, force: true });
  await rm(path.join(PUBLIC_DIST, 'login'), { recursive: true, force: true });
  await rm(path.join(PUBLIC_DIST, '_worker.js'), { force: true });
  await rm(path.join(PUBLIC_DIST, 'functions'), { recursive: true, force: true });

  for (const slug of staffSlugs) {
    await rm(path.join(PUBLIC_DIST, 'private', slug), { recursive: true, force: true });
    await rm(path.join(PUBLIC_DIST, 'raw', 'private', slug), { recursive: true, force: true });
  }

  // Advanced-mode Pages worker: protects the whole admin deployment.
  await cp(ADMIN_WORKER, path.join(ADMIN_DIST, '_worker.js'));

  console.log(
    `[split] dist-public pronto (senza /admin, ${staffSlugs.length} cartelle staff rimosse).`,
  );
  console.log(
    `[split] dist-admin pronto (slug staff: ${staffSlugs.join(', ') || 'nessuno'}, login protetto).`,
  );
}

await main();
