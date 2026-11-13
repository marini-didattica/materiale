import { afterEach, describe, expect, test } from 'bun:test';
import { mkdir, mkdtemp, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { validateExams } from './exams';
const roots: string[] = [];

afterEach(async () => {
  await Promise.all(roots.map((root) => rm(root, { recursive: true, force: true })));
  roots.length = 0;
});

async function makeRoot(files: Record<string, string>): Promise<string> {
  const root = await mkdtemp(path.join(tmpdir(), 'materiale-exams-'));
  roots.push(root);

  for (const [relative, contents] of Object.entries(files)) {
    const filePath = path.join(root, relative);
    await mkdir(path.dirname(filePath), { recursive: true });
    await writeFile(filePath, contents, 'utf8');
  }

  return root;
}

function exam(): string {
  return JSON.stringify({
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
  });
}

function fixture(extra: Record<string, string> = {}): Record<string, string> {
  return {
    'content/raw/private/admin/tests/prova-1-1c/testo/prova-1-1c.json': exam(),
    'content/raw/private/admin/tests/prova-1-1c/testo/prova-1-1c.typ': '= prova',
    'content/raw/private/admin/tests/prova-1-1c/testo/parts/D1.typ': '= D1',
    'content/raw/private/admin/tests/prova-1-1c/soluzione/D1.txt': 'risposta',
    'content/raw/private/admin/corrections/1c/prova-1/manifest.json': JSON.stringify({
      version: 1,
      test: 'prova-1-1c',
      date: '12 novembre 2026',
    }),
    'content/raw/private/admin/corrections/1c/prova-1/correzioni/studente-prova.json':
      JSON.stringify({ set: 'default', exercises: { D1: null } }),
    ...extra,
  };
}

describe('validateExams', () => {
  test('accepts a conventional test and its correction cohort', async () => {
    const root = await makeRoot(fixture());
    const result = await validateExams(path.join(root, 'content'));

    expect(result).toEqual({ tests: 1, manifests: 1, corrections: 1 });
  });

  test('accepts a per-student test override', async () => {
    const root = await makeRoot(
      fixture({
        'content/raw/private/admin/tests/prova-1-1d/testo/prova-1-1d.json': exam(),
        'content/raw/private/admin/tests/prova-1-1d/testo/prova-1-1d.typ': '= prova',
        'content/raw/private/admin/tests/prova-1-1d/testo/parts/D1.typ': '= D1',
        'content/raw/private/admin/tests/prova-1-1d/soluzione/D1.txt': 'risposta',
        'content/raw/private/admin/corrections/1c/prova-1/correzioni/studente-prova.json':
          JSON.stringify({
            test: 'prova-1-1d',
            set: 'default',
            exercises: { D1: null },
          }),
      }),
    );

    const result = await validateExams(path.join(root, 'content'));
    expect(result).toEqual({ tests: 2, manifests: 1, corrections: 1 });
  });

  test('rejects a missing test', async () => {
    const root = await makeRoot(
      fixture({
        'content/raw/private/admin/corrections/1c/prova-1/manifest.json': JSON.stringify({
          version: 1,
          test: 'prova-mancante',
          date: '12 novembre 2026',
        }),
      }),
    );

    await expect(validateExams(path.join(root, 'content'))).rejects.toThrow(
      /prova "prova-mancante" non trovata/,
    );
  });

  test('rejects exercises that do not belong to the effective set', async () => {
    const root = await makeRoot(
      fixture({
        'content/raw/private/admin/corrections/1c/prova-1/correzioni/studente-prova.json':
          JSON.stringify({ set: 'default', exercises: { D2: null } }),
      }),
    );

    try {
      await validateExams(path.join(root, 'content'));
      throw new Error('expected validateExams to reject');
    } catch (error) {
      const message = (error as Error).message;
      expect(message).toContain('esercizio "D2" assente dal set "default"');
      expect(message).toContain('manca l\'esercizio "D1"');
    }
  });
});
