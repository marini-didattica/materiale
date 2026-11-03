import { afterEach, describe, expect, test } from 'bun:test';
import { mkdir, mkdtemp, rename, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import path from 'node:path';
import {
  assertAllTypstRulesUsed,
  evaluateFile,
  loadDeployConfig,
  scopesForDir,
  typstOutputPath,
} from './deploy-config';

const roots: string[] = [];

afterEach(async () => {
  await Promise.all(roots.map((root) => rm(root, { recursive: true, force: true })));
  roots.length = 0;
});

async function makeRoot(files: Record<string, string> = {}): Promise<string> {
  const root = await mkdtemp(path.join(tmpdir(), 'materiale-deploy-'));
  roots.push(root);
  await mkdir(path.join(root, 'content', 'raw'), { recursive: true });

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

describe('loadDeployConfig', () => {
  test('uses backwards-compatible defaults without a config file', async () => {
    const root = await makeRoot();
    const config = await loadDeployConfig(root);

    expect(config.settings).toEqual({
      defaultAction: 'compile',
      underscoreAction: 'publish',
      format: 'pdf',
    });
    expect(config.rootScope.ignore).toBeNull();
    expect(config.rootScope.typstRules).toEqual([]);
  });

  test('reads global ignore and typst settings', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
version = 1

[ignore]
patterns = ["public/ignored/*", "!public/ignored/keep.txt", "*.tmp"]

[typst]
default_action = "publish"
underscore_action = "ignore"
format = "pdf"
`,
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(config, config.rawDir);

    expect(config.settings.defaultAction).toBe('publish');
    expect(config.settings.underscoreAction).toBe('ignore');

    const ignored = evaluateFile(config, scopes, at(root, 'content/raw/public/ignored/a.txt'));
    const kept = evaluateFile(config, scopes, at(root, 'content/raw/public/ignored/keep.txt'));
    const nestedTmp = evaluateFile(config, scopes, at(root, 'content/raw/public/x/a.tmp'));
    const source = evaluateFile(config, scopes, at(root, 'content/raw/public/x/a.typ'));
    const underscore = evaluateFile(config, scopes, at(root, 'content/raw/public/x/_a.typ'));

    expect(ignored.ignored).toBe(true);
    expect(kept.ignored).toBe(false);
    expect(nestedTmp.ignored).toBe(true);
    expect(source.typstAction).toBe('publish');
    expect(underscore.typstAction).toBe('ignore');
  });

  test('applies ordered typst overrides, last match wins', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[typst]
default_action = "compile"

[[typst.override]]
glob = "**/*.typ"
action = "ignore"

[[typst.override]]
glob = "public/keep.typ"
action = "compile"
`,
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(config, config.rawDir);

    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/public/keep.typ')).typstAction,
    ).toBe('compile');
    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/public/other.typ')).typstAction,
    ).toBe('ignore');
  });

  test('local scopes override root rules and apply recursively', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[ignore]
patterns = ["public/folder/soluzione/*"]
`,
      'content/raw/public/folder/deploy.toml': `
[ignore]
patterns = ["!soluzione/README.md"]

[[typst.override]]
glob = "_*.typ"
action = "publish"
`,
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(config, at(root, 'content/raw/public/folder'));

    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/public/folder/soluzione/a.txt'))
        .ignored,
    ).toBe(true);
    expect(
      evaluateFile(
        config,
        scopes,
        at(root, 'content/raw/public/folder/soluzione/README.md'),
      ).ignored,
    ).toBe(false);
    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/public/folder/sub/_a.typ'))
        .typstAction,
    ).toBe('publish');
    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/public/folder/sub/a.typ'))
        .typstAction,
    ).toBe('compile');
  });

  test('local scopes also apply from parent folders of a student tree', async () => {
    const root = await makeRoot({
      'content/raw/private/1c/deploy.toml': `
[[typst.override]]
glob = "**/_*.typ"
action = "ignore"
`,
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(
      config,
      at(root, 'content/raw/private/1c/angeli-lorenzo'),
    );

    expect(
      evaluateFile(
        config,
        scopes,
        at(root, 'content/raw/private/1c/angeli-lorenzo/domande/_S1.typ'),
      ).typstAction,
    ).toBe('ignore');
  });

  test('supports anchored patterns with a leading slash', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[ignore]
patterns = ["/public/only.txt"]
`,
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(config, config.rawDir);

    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/public/only.txt')).ignored,
    ).toBe(true);
    expect(
      evaluateFile(config, scopes, at(root, 'content/raw/sub/public/only.txt')).ignored,
    ).toBe(false);
  });

  test('local config follows its folder when the folder is moved', async () => {
    const root = await makeRoot({
      'content/raw/public/vecchia/deploy.toml': `
[ignore]
patterns = ["scartati/*"]
`,
      'content/raw/public/vecchia/scartati/a.txt': 'a',
    });

    const config = await loadDeployConfig(root);
    const before = await scopesForDir(config, at(root, 'content/raw/public/vecchia'));
    expect(
      evaluateFile(config, before, at(root, 'content/raw/public/vecchia/scartati/a.txt'))
        .ignored,
    ).toBe(true);

    await rename(
      at(root, 'content/raw/public/vecchia'),
      at(root, 'content/raw/public/nuova'),
    );

    const after = await scopesForDir(config, at(root, 'content/raw/public/nuova'));
    expect(
      evaluateFile(config, after, at(root, 'content/raw/public/nuova/scartati/a.txt'))
        .ignored,
    ).toBe(true);
  });

  test('rejects invalid configs', async () => {
    const cases: Array<[string, string, string]> = [
      ['unknown-key', 'version = 1\nunknown = true\n', 'chiave sconosciuta'],
      ['bad-version', 'version = 2\n', 'versione non supportata'],
      [
        'bad-action',
        '[typst]\ndefault_action = "copy"\n',
        'default_action',
      ],
      [
        'bad-underscore',
        '[typst]\nunderscore_action = "skip"\n',
        'underscore_action',
      ],
      [
        'bad-format',
        '[typst]\nformat = "svg"\n',
        'format',
      ],
      [
        'array-typst',
        '[[typst]]\nglob = "*.typ"\naction = "ignore"\n',
        '[[typst.override]]',
      ],
      [
        'negated-glob',
        '[[typst.override]]\nglob = "!*.typ"\naction = "ignore"\n',
        'non può iniziare',
      ],
      [
        'escaping-ignore',
        '[ignore]\npatterns = ["../foo"]\n',
        'non può uscire',
      ],
      [
        'local-global',
        '[typst]\ndefault_action = "ignore"\n',
        'impostazione globale',
      ],
      [
        'local-version',
        'version = 1\n',
        'solo in content/deploy.toml',
      ],
    ];

    for (const [name, contents, message] of cases) {
      const root = await makeRoot({
        [name === 'local-global' || name === 'local-version'
          ? 'content/raw/public/folder/deploy.toml'
          : 'content/deploy.toml']: contents,
      });

      if (name === 'local-global' || name === 'local-version') {
        const config = await loadDeployConfig(root);
        await expect(
          scopesForDir(config, at(root, 'content/raw/public/folder')),
        ).rejects.toThrow(message);
      } else {
        await expect(loadDeployConfig(root)).rejects.toThrow(message);
      }
    }
  });
});

describe('typstOutputPath', () => {
  test('strips the source-only underscore from compiled and published names', () => {
    expect(typstOutputPath('prime/foo.typ', 'compile', 'pdf')).toBe('prime/foo.pdf');
    expect(typstOutputPath('prime/_foo.typ', 'compile', 'pdf')).toBe('prime/foo.pdf');
    expect(typstOutputPath('prime/foo.typ', 'publish', 'pdf')).toBe('prime/foo.typ');
    expect(typstOutputPath('prime/_foo.typ', 'publish', 'pdf')).toBe('prime/foo.typ');
  });

  test('keeps extra dots in the stem', () => {
    expect(typstOutputPath('prime/foo.bar.typ', 'compile', 'pdf')).toBe(
      'prime/foo.bar.pdf',
    );
  });

  test('rejects names without a stem', () => {
    expect(() => typstOutputPath('prime/_.typ', 'compile', 'pdf')).toThrow(
      'non produce un nome file valido',
    );
  });
});

describe('assertAllTypstRulesUsed', () => {
  test('fails when an override matches nothing', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[[typst.override]]
glob = "missing/*.typ"
action = "ignore"
`,
    });

    const config = await loadDeployConfig(root);
    expect(() => assertAllTypstRulesUsed(config)).toThrow('senza file corrispondenti');
  });

  test('passes when every override matched a file', async () => {
    const root = await makeRoot({
      'content/deploy.toml': `
[[typst.override]]
glob = "public/*.typ"
action = "ignore"
`,
    });

    const config = await loadDeployConfig(root);
    const scopes = await scopesForDir(config, config.rawDir);
    evaluateFile(config, scopes, at(root, 'content/raw/public/a.typ'));

    expect(() => assertAllTypstRulesUsed(config)).not.toThrow();
  });
});
