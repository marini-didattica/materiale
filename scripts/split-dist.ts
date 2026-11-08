import { access, cp, readFile, rm, writeFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import type { Students } from '../src/types';

/**
 * Split Astro's single `dist/` into the two Cloudflare Pages deployments:
 *
 *   dist-public/  public browser, student browsers, public/private raw files
 *   dist-admin/   everything above plus the admin browser and staff files
 *
 * The admin deployment is protected in full by Cloudflare Access. The public
 * deployment must never contain `/admin` or a staff slug's raw tree.
 */

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const DIST = path.join(ROOT, 'dist');
const PUBLIC_DIST = path.join(ROOT, 'dist-public');
const ADMIN_DIST = path.join(ROOT, 'dist-admin');
const STUDENTS_PATH = path.join(ROOT, 'content', 'students.json');

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

  for (const slug of staffSlugs) {
    await rm(path.join(PUBLIC_DIST, 'private', slug), { recursive: true, force: true });
    await rm(path.join(PUBLIC_DIST, 'raw', 'private', slug), { recursive: true, force: true });
  }

  // The admin host is fully protected; its root should land on the browser.
  await writeFile(path.join(ADMIN_DIST, '_redirects'), '/ /admin/ 302\n', 'utf8');

  console.log(
    `[split] dist-public pronto (senza /admin, ${staffSlugs.length} cartelle staff rimosse).`,
  );
  console.log(
    `[split] dist-admin pronto (slug staff: ${staffSlugs.join(', ') || 'nessuno'}).`,
  );
}

await main();
