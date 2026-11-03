import { afterEach, describe, expect, test } from 'bun:test';
import { access, mkdir, mkdtemp, readFile, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { loadDeployConfig, scopesForDir } from './deploy-config';
import { publishTree, walkFiles, type CompileFn } from './content-publisher';

const roots: string[] = [];

afterEach(async () => {
  await Promise.all(roots.map((root) => rm(root, { recursive: true, force: true })));
  roots.length = 0;
});

async function makeRoot(files: Record<string, string> = {}): Promise<string> {
  const root = await mkdtemp(path.join(tmpdir(), 'materiale-publish-'));
  roots.push(root);
  await mkdir(path.join(root, 'content', 'raw', 'public'), { recursive: true });

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

describe('publishTree', () => {
  test('copies, compiles, publishes and drops files according to the config', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[typst]
default_action = "compile"
underscore_action = "publish"

[[typst.override]]
glob = "**/domande/_S1.typ"
action = "ignore"
`,
      'content/raw/public/prime/foo.typ': '= foo',
      'content/raw/public/prime/_foo.typ': '= published foo',
      'content/raw/public/prime/notes.txt': 'notes',
      'content/raw/public/prime/secret.txt': 'secret',
      'content/raw/public/prime/skip.exe': 'binary',
      'content/raw/public/prime/deploy.toml': `
[ignore]
patterns = ["secret.txt"]
`,
      'content/raw/public/prime/domande/_S1.typ': '= fragment',
    });

    const config = await loadDeployConfig(root);
    const result = await publishTree(
      at(root, 'content/raw/public'),
      at(root, 'static/raw/public'),
      config,
      root,
      fakeCompile,
    );

    expect(result.copied).toBe(1);
    expect(result.compiled).toBe(1);
    expect(result.published).toBe(1);
    expect(result.ignored).toBe(2);
    expect(result.skipped).toEqual(new Set(['.exe']));

    expect(await exists(at(root, 'static/raw/public/prime/foo.pdf'))).toBe(true);
    expect(await exists(at(root, 'static/raw/public/prime/foo.typ'))).toBe(true);
    expect(await exists(at(root, 'static/raw/public/prime/notes.txt'))).toBe(true);
    expect(await exists(at(root, 'static/raw/public/prime/secret.txt'))).toBe(false);
    expect(await exists(at(root, 'static/raw/public/prime/skip.exe'))).toBe(false);
    expect(await exists(at(root, 'static/raw/public/prime/deploy.toml'))).toBe(false);
    expect(await exists(at(root, 'static/raw/public/prime/domande/_S1.typ'))).toBe(false);

    expect(await readFile(at(root, 'static/raw/public/prime/foo.pdf'), 'utf8')).toBe(
      'compiled from foo.typ',
    );
    expect(await readFile(at(root, 'static/raw/public/prime/foo.typ'), 'utf8')).toBe(
      '= published foo',
    );
  });

  test('applies local deploy.toml rules recursively', async () => {
    const root = await makeRoot({
      'content/raw/public/folder/deploy.toml': `
[ignore]
patterns = ["soluzione/*"]

[[typst.override]]
glob = "_*.typ"
action = "publish"
`,
      'content/raw/public/folder/soluzione/esercizio.py': 'print(1)',
      'content/raw/public/folder/nota.txt': 'nota',
      'content/raw/public/folder/sub/_frammento.typ': '= frammento',
    });

    const config = await loadDeployConfig(root);
    await publishTree(
      at(root, 'content/raw/public'),
      at(root, 'static/raw/public'),
      config,
      root,
      fakeCompile,
    );

    expect(await exists(at(root, 'static/raw/public/folder/soluzione/esercizio.py'))).toBe(
      false,
    );
    expect(await exists(at(root, 'static/raw/public/folder/nota.txt'))).toBe(true);
    expect(
      await exists(at(root, 'static/raw/public/folder/sub/frammento.typ')),
    ).toBe(true);
  });

  test('fails when two typst sources produce the same destination', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[typst]
underscore_action = "compile"
`,
      'content/raw/public/foo.typ': '= foo',
      'content/raw/public/_foo.typ': '= underscore foo',
    });

    const config = await loadDeployConfig(root);

    await expect(
      publishTree(
        at(root, 'content/raw/public'),
        at(root, 'static/raw/public'),
        config,
        root,
        fakeCompile,
      ),
    ).rejects.toThrow('stesso file');
  });

  test('fails when a typst rule matches a non-typst file', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[[typst.override]]
glob = "**/*"
action = "ignore"
`,
      'content/raw/public/notes.txt': 'notes',
    });

    const config = await loadDeployConfig(root);

    await expect(
      publishTree(
        at(root, 'content/raw/public'),
        at(root, 'static/raw/public'),
        config,
        root,
        fakeCompile,
      ),
    ).rejects.toThrow('non Typst');
  });

  test('walkFiles can skip typst tracking for validation walks', async () => {
    const root = await makeRoot({
      'content/raw/public/foo.typ': '= foo',
      'content/raw/public/notes.txt': 'notes',
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(config, at(root, 'content/raw/public'));
    const result = await walkFiles(
      at(root, 'content/raw/public'),
      config,
      scopes,
      { trackTypst: false },
    );

    expect(result.files).toHaveLength(2);
    expect(result.files.every((file) => file.typstAction === null)).toBe(true);
  });
});
