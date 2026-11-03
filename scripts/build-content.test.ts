import { afterEach, describe, expect, test } from 'bun:test';
import { access, mkdir, mkdtemp, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { buildContent } from './build-content';
import type { CompileFn } from './lib/content-publisher';

const roots: string[] = [];

afterEach(async () => {
  await Promise.all(roots.map((root) => rm(root, { recursive: true, force: true })));
  roots.length = 0;
});

async function makeRoot(files: Record<string, string>): Promise<string> {
  const root = await mkdtemp(path.join(tmpdir(), 'materiale-build-'));
  roots.push(root);

  for (const [relative, contents] of Object.entries(files)) {
    const filePath = path.join(root, relative);
    await mkdir(path.dirname(filePath), { recursive: true });
    await writeFile(filePath, contents, 'utf8');
  }

  return root;
}

function at(root: string, relative: string): string {
  return path.join(root, relative);
}

const fakeCompile: CompileFn = async (source, destination) => {
  await mkdir(path.dirname(destination), { recursive: true });
  await writeFile(destination, `compiled from ${path.basename(source)}`, 'utf8');
};

async function exists(filePath: string): Promise<boolean> {
  try {
    await access(filePath);
    return true;
  } catch {
    return false;
  }
}

describe('buildContent', () => {
  test('stages public and private content with local deploy config', async () => {
    const root = await makeRoot({
      'content/students.json': JSON.stringify({
        '1c/studente-prova': {
          slug: 'ABCD1234',
          'owner-first-names': ['Ada'],
          'owner-last-names': ['Prova'],
        },
      }),
      'content/deploy.toml': `
[ignore]
patterns = ["**/secret.txt"]
`,
      'content/raw/public/prime/lezione.typ': '= lezione',
      'content/raw/private/1c/studente-prova/deploy.toml': `
[[typst.override]]
glob = "_*.typ"
action = "ignore"
`,
      'content/raw/private/1c/studente-prova/main.typ': '= main',
      'content/raw/private/1c/studente-prova/_frammento.typ': '= frammento',
      'content/raw/private/1c/studente-prova/secret.txt': 'secret',
    });

    await buildContent(root, { compile: fakeCompile });

    expect(await exists(at(root, 'static/raw/public/prime/lezione.pdf'))).toBe(true);
    expect(
      await exists(at(root, 'static/raw/private/ABCD1234/main.pdf')),
    ).toBe(true);
    expect(
      await exists(at(root, 'static/raw/private/ABCD1234/_frammento.typ')),
    ).toBe(false);
    expect(
      await exists(at(root, 'static/raw/private/ABCD1234/frammento.typ')),
    ).toBe(false);
    expect(
      await exists(at(root, 'static/raw/private/ABCD1234/secret.txt')),
    ).toBe(false);
  });
});
