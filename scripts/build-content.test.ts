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

  test('publishes correction PDFs for cohorts with publish: true', async () => {
    const sources: string[] = [];
    const destinations: string[] = [];
    const recordingCompile: CompileFn = async (source, destination) => {
      sources.push(source);
      destinations.push(destination);
      await mkdir(path.dirname(destination), { recursive: true });
      await writeFile(destination, 'correction', 'utf8');
    };

    const root = await makeRoot({
      'content/students.json': JSON.stringify({
        '1c/studente-prova': {
          slug: 'ABCD1234',
          'owner-first-names': ['Ada'],
          'owner-last-names': ['Prova'],
        },
        admin: {
          slug: 'MRNMTT03',
          'owner-first-names': ['Mattia'],
          'owner-last-names': ['Marini'],
          staff: true,
        },
      }),
      'content/deploy.toml': `
[ignore]
patterns = []
`,
      'content/raw/public/prime/lezione.typ': '= lezione',
      'content/raw/private/1c/studente-prova/prova-1/le-tue-risposte/domanda1.txt': 'risposta',
      'content/raw/private/admin/tests/1-prova-1a/testo/1-prova-1a.json': JSON.stringify({
        version: 1,
        sets: ['default'],
        categories: [
          {
            id: 'D',
            tag: 'Domanda',
            title: 'Teoria',
            exercises: [
              { id: 'D1', file: 'parts/D1.typ', title: 'Q1', points: 10, difficulty: 1 },
            ],
          },
        ],
      }),
      'content/raw/private/admin/tests/1-prova-1a/testo/1-prova-1a.typ': '= prova',
      'content/raw/private/admin/tests/1-prova-1a/testo/parts/D1.typ': '= D1',
      'content/raw/private/admin/tests/1-prova-1a/soluzione/D1.txt': 'risposta',
      'content/raw/private/admin/corrections/1c/prova-1/manifest.json': JSON.stringify({
        version: 1,
        test: '1-prova-1a',
        date: '12 novembre 2026',
        publish: true,
      }),
      'content/raw/private/admin/corrections/1c/prova-1/correzioni/studente-prova.json':
        JSON.stringify({ set: 'default', exercises: { D1: null } }),
    });

    await buildContent(root, { compile: recordingCompile });

    const correctionPdf = 'static/raw/private/ABCD1234/prova-1/correzione.pdf';
    expect(await exists(at(root, correctionPdf))).toBe(true);
    expect(destinations).toContain(at(root, correctionPdf));
    expect(sources.some((source) => source.includes('.correzioni-src'))).toBe(true);
    expect(await exists(at(root, 'static/raw/.correzioni-src'))).toBe(false);
  });

  test('does not publish corrections when publish is omitted', async () => {
    const root = await makeRoot({
      'content/students.json': JSON.stringify({
        '1c/studente-prova': {
          slug: 'ABCD1234',
          'owner-first-names': ['Ada'],
          'owner-last-names': ['Prova'],
        },
        admin: {
          slug: 'MRNMTT03',
          'owner-first-names': ['Mattia'],
          'owner-last-names': ['Marini'],
          staff: true,
        },
      }),
      'content/deploy.toml': `
[ignore]
patterns = []
`,
      'content/raw/public/prime/lezione.typ': '= lezione',
      'content/raw/private/1c/studente-prova/prova-1/le-tue-risposte/domanda1.txt': 'risposta',
      'content/raw/private/admin/tests/1-prova-1a/testo/1-prova-1a.json': JSON.stringify({
        version: 1,
        sets: ['default'],
        categories: [
          {
            id: 'D',
            tag: 'Domanda',
            title: 'Teoria',
            exercises: [
              { id: 'D1', file: 'parts/D1.typ', title: 'Q1', points: 10, difficulty: 1 },
            ],
          },
        ],
      }),
      'content/raw/private/admin/tests/1-prova-1a/testo/1-prova-1a.typ': '= prova',
      'content/raw/private/admin/tests/1-prova-1a/testo/parts/D1.typ': '= D1',
      'content/raw/private/admin/tests/1-prova-1a/soluzione/D1.txt': 'risposta',
      'content/raw/private/admin/corrections/1c/prova-1/manifest.json': JSON.stringify({
        version: 1,
        test: '1-prova-1a',
        date: '12 novembre 2026',
      }),
      'content/raw/private/admin/corrections/1c/prova-1/correzioni/studente-prova.json':
        JSON.stringify({ set: 'default', exercises: { D1: null } }),
    });

    await buildContent(root, { compile: fakeCompile });

    expect(
      await exists(at(root, 'static/raw/private/ABCD1234/prova-1/correzione.pdf')),
    ).toBe(false);
  });
});
