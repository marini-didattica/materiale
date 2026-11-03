import { readFile } from 'node:fs/promises';
import path from 'node:path';
import ignore from 'ignore';
import { parse } from 'smol-toml';

export const DEPLOY_CONFIG_NAME = 'deploy.toml';

export type TypstAction = 'compile' | 'publish' | 'ignore';
export type UnderscoreAction = 'default' | TypstAction;
export type TypstFormat = 'pdf';

export interface TypstSettings {
  defaultAction: TypstAction;
  underscoreAction: UnderscoreAction;
  format: TypstFormat;
}

export interface TypstRule {
  glob: string;
  action: TypstAction;
  label: string;
  matcher: ReturnType<typeof ignore>;
  hits: number;
}

export interface DeployScope {
  /** Path shown in errors, relative to the repository root when possible. */
  label: string;
  /** Absolute directory the scope's patterns are relative to. */
  baseDir: string;
  ignore: ReturnType<typeof ignore> | null;
  ignorePatterns: readonly string[];
  typstRules: readonly TypstRule[];
}

export interface DeployConfig {
  rootDir: string;
  rawDir: string;
  settings: TypstSettings;
  rootScope: DeployScope;
  /** Every loaded scope, used to check that all typst rules were applied. */
  scopes: DeployScope[];
  /** Parsed local scopes, including missing ones (`null`). */
  localScopes: Map<string, DeployScope | null>;
}

export interface FileDecision {
  ignored: boolean;
  typstAction: TypstAction | null;
  matchedRules: TypstRule[];
}

const DEFAULT_SETTINGS: TypstSettings = {
  defaultAction: 'compile',
  underscoreAction: 'publish',
  format: 'pdf',
};

const TYPST_ACTIONS = new Set<TypstAction>(['compile', 'publish', 'ignore']);
const UNDERSCORE_ACTIONS = new Set<UnderscoreAction>([
  'default',
  'compile',
  'publish',
  'ignore',
]);

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function toPosix(value: string): string {
  return value.split(path.sep).join('/');
}

function displayPath(rootDir: string, filePath: string): string {
  return toPosix(path.relative(rootDir, filePath));
}

function assertKnownKeys(
  value: Record<string, unknown>,
  allowed: ReadonlySet<string>,
  label: string,
) {
  for (const key of Object.keys(value)) {
    if (!allowed.has(key)) {
      throw new Error(`[deploy] ${label}: chiave sconosciuta "${key}".`);
    }
  }
}

function assertSafePattern(pattern: string, label: string, allowNegation: boolean) {
  if (typeof pattern !== 'string' || pattern.trim() === '') {
    throw new Error(`[deploy] ${label}: i pattern devono essere stringhe non vuote.`);
  }

  if (pattern.includes('\0')) {
    throw new Error(`[deploy] ${label}: il pattern "${pattern}" contiene un carattere non valido.`);
  }

  if (!allowNegation && pattern.startsWith('!')) {
    throw new Error(
      `[deploy] ${label}: il pattern "${pattern}" non può iniziare con "!". ` +
        'Usa un override successivo per riattivare un file.',
    );
  }

  const body = pattern.startsWith('!') ? pattern.slice(1) : pattern;
  const normalized = body.replace(/^\/+/, '');

  if (normalized === '') {
    throw new Error(
      `[deploy] ${label}: il pattern "${pattern}" deve essere un percorso relativo.`,
    );
  }

  if (normalized.split('/').some((segment) => segment === '..')) {
    throw new Error(
      `[deploy] ${label}: il pattern "${pattern}" non può uscire dalla cartella del file deploy.toml.`,
    );
  }
}

function parseTypstAction(value: unknown, label: string, key: string): TypstAction {
  if (typeof value !== 'string' || !TYPST_ACTIONS.has(value as TypstAction)) {
    throw new Error(
      `[deploy] ${label}: "${key}" deve essere uno tra compile, publish, ignore.`,
    );
  }

  return value as TypstAction;
}

function parseIgnoreSection(value: unknown, label: string): {
  patterns: string[];
  matcher: ReturnType<typeof ignore> | null;
} {
  if (value === undefined) {
    return { patterns: [], matcher: null };
  }

  if (!isRecord(value)) {
    throw new Error(`[deploy] ${label}: [ignore] deve essere una tabella.`);
  }

  assertKnownKeys(value, new Set(['patterns']), `${label} [ignore]`);

  const patterns = value.patterns ?? [];

  if (!Array.isArray(patterns)) {
    throw new Error(`[deploy] ${label}: "ignore.patterns" deve essere un array di stringhe.`);
  }

  for (const pattern of patterns) {
    assertSafePattern(pattern as string, `${label} [ignore]`, true);
  }

  return {
    patterns: patterns as string[],
    matcher: patterns.length > 0 ? ignore().add(patterns as string[]) : null,
  };
}

function parseTypstOverrides(value: unknown, label: string): TypstRule[] {
  if (value === undefined) return [];

  if (!Array.isArray(value)) {
    throw new Error(
      `[deploy] ${label}: "typst.override" deve essere un array di tabelle ([[typst.override]]).`,
    );
  }

  return value.map((entry, index) => {
    const ruleLabel = `${label} [[typst.override]] #${index + 1}`;

    if (!isRecord(entry)) {
      throw new Error(`[deploy] ${ruleLabel}: la regola deve essere una tabella.`);
    }

    assertKnownKeys(entry, new Set(['glob', 'action']), ruleLabel);

    if (typeof entry.glob !== 'string') {
      throw new Error(`[deploy] ${ruleLabel}: manca "glob".`);
    }

    assertSafePattern(entry.glob, ruleLabel, false);

    if (entry.action === undefined) {
      throw new Error(`[deploy] ${ruleLabel}: manca "action".`);
    }

    return {
      glob: entry.glob,
      action: parseTypstAction(entry.action, ruleLabel, 'action'),
      label: `${label}: ${entry.glob}`,
      matcher: ignore().add(entry.glob),
      hits: 0,
    };
  });
}

function parseTypstSection(value: unknown, label: string, isRoot: boolean): {
  settings: TypstSettings | null;
  rules: TypstRule[];
} {
  if (value === undefined) {
    return { settings: isRoot ? { ...DEFAULT_SETTINGS } : null, rules: [] };
  }

  if (!isRecord(value)) {
    throw new Error(
      `[deploy] ${label}: [typst] deve essere una tabella. ` +
        'Per una regola usa [[typst.override]].',
    );
  }

  if (!isRoot) {
    for (const key of ['default_action', 'underscore_action', 'format']) {
      if (key in value) {
        throw new Error(
          `[deploy] ${label}: "${key}" è un'impostazione globale e va in content/deploy.toml.`,
        );
      }
    }
  }

  assertKnownKeys(
    value,
    new Set(isRoot ? ['default_action', 'underscore_action', 'format', 'override'] : ['override']),
    `${label} [typst]`,
  );

  const settings = isRoot
    ? {
        defaultAction:
          value.default_action === undefined
            ? DEFAULT_SETTINGS.defaultAction
            : parseTypstAction(value.default_action, label, 'default_action'),
        underscoreAction: (() => {
          if (value.underscore_action === undefined) {
            return DEFAULT_SETTINGS.underscoreAction;
          }

          if (
            typeof value.underscore_action !== 'string' ||
            !UNDERSCORE_ACTIONS.has(value.underscore_action as UnderscoreAction)
          ) {
            throw new Error(
              `[deploy] ${label}: "underscore_action" deve essere uno tra ` +
                'default, compile, publish, ignore.',
            );
          }

          return value.underscore_action as UnderscoreAction;
        })(),
        format: (() => {
          if (value.format === undefined) return DEFAULT_SETTINGS.format;

          if (value.format !== 'pdf') {
            throw new Error(`[deploy] ${label}: "format" supporta solo "pdf" per ora.`);
          }

          return 'pdf' as const;
        })(),
      }
    : null;

  return {
    settings,
    rules: parseTypstOverrides(value.override, label),
  };
}

function parseScope(
  text: string,
  options: { baseDir: string; label: string; isRoot: boolean },
): { scope: DeployScope; settings: TypstSettings | null } {
  let parsed: unknown;

  try {
    parsed = parse(text);
  } catch (error) {
    throw new Error(
      `[deploy] ${options.label}: TOML non valido: ${(error as Error).message}`,
    );
  }

  if (!isRecord(parsed)) {
    throw new Error(`[deploy] ${options.label}: il file deve contenere una tabella TOML.`);
  }

  assertKnownKeys(
    parsed,
    new Set(['version', 'ignore', 'typst']),
    options.label,
  );

  if (!options.isRoot && parsed.version !== undefined) {
    throw new Error(
      `[deploy] ${options.label}: "version" va dichiarata solo in content/deploy.toml.`,
    );
  }

  if (options.isRoot && parsed.version !== undefined && parsed.version !== 1) {
    throw new Error(`[deploy] ${options.label}: versione non supportata: ${String(parsed.version)}.`);
  }

  const { patterns, matcher } = parseIgnoreSection(parsed.ignore, options.label);
  const { settings, rules } = parseTypstSection(parsed.typst, options.label, options.isRoot);

  return {
    settings,
    scope: {
      label: options.label,
      baseDir: options.baseDir,
      ignore: matcher,
      ignorePatterns: patterns,
      typstRules: rules,
    },
  };
}

function isInsideOrEqual(parent: string, child: string): boolean {
  const relative = path.relative(parent, child);
  return (
    relative === '' ||
    (relative !== '..' &&
      !relative.startsWith(`..${path.sep}`) &&
      !path.isAbsolute(relative))
  );
}

async function readOptionalFile(filePath: string): Promise<string | null> {
  try {
    return await readFile(filePath, 'utf8');
  } catch (error) {
    if ((error as NodeJS.ErrnoException).code === 'ENOENT') return null;
    throw error;
  }
}

export async function loadDeployConfig(rootDir: string): Promise<DeployConfig> {
  const rawDir = path.join(rootDir, 'content', 'raw');
  const configPath = path.join(rootDir, 'content', DEPLOY_CONFIG_NAME);
  const label = displayPath(rootDir, configPath);
  const text = await readOptionalFile(configPath);

  let rootScope: DeployScope;
  let settings = { ...DEFAULT_SETTINGS };

  if (text === null) {
    rootScope = {
      label: '(default)',
      baseDir: rawDir,
      ignore: null,
      ignorePatterns: [],
      typstRules: [],
    };
  } else {
    const parsed = parseScope(text, {
      baseDir: rawDir,
      label,
      isRoot: true,
    });

    rootScope = parsed.scope;
    if (parsed.settings) settings = parsed.settings;
  }

  return {
    rootDir,
    rawDir,
    settings,
    rootScope,
    scopes: [rootScope],
    localScopes: new Map(),
  };
}

export async function loadLocalScope(
  config: DeployConfig,
  dir: string,
): Promise<DeployScope | null> {
  if (!isInsideOrEqual(config.rawDir, dir)) return null;

  const cached = config.localScopes.get(dir);
  if (cached !== undefined) return cached;

  const configPath = path.join(dir, DEPLOY_CONFIG_NAME);
  const label = displayPath(config.rootDir, configPath);
  const text = await readOptionalFile(configPath);

  if (text === null) {
    config.localScopes.set(dir, null);
    return null;
  }

  const parsed = parseScope(text, {
    baseDir: dir,
    label,
    isRoot: false,
  });

  config.localScopes.set(dir, parsed.scope);
  config.scopes.push(parsed.scope);
  return parsed.scope;
}

/** Root scope plus every local deploy.toml between content/raw and `dir`. */
export async function scopesForDir(
  config: DeployConfig,
  dir: string,
): Promise<DeployScope[]> {
  if (!isInsideOrEqual(config.rawDir, dir)) {
    throw new Error(
      `[deploy] "${dir}" non è dentro ${toPosix(path.relative(config.rootDir, config.rawDir))}.`,
    );
  }

  const scopes: DeployScope[] = [config.rootScope];

  const rawScope = await loadLocalScope(config, config.rawDir);
  if (rawScope) scopes.push(rawScope);

  const relative = path.relative(config.rawDir, dir);
  if (relative !== '') {
    let current = config.rawDir;

    for (const segment of relative.split(path.sep)) {
      current = path.join(current, segment);
      const scope = await loadLocalScope(config, current);
      if (scope) scopes.push(scope);
    }
  }

  return scopes;
}

/**
 * Evaluate ignore rules and typst overrides for one file. Scopes are ordered
 * from the shallowest to the deepest; the last matching decision wins.
 */
export function evaluateFile(
  config: DeployConfig,
  scopes: readonly DeployScope[],
  absolutePath: string,
  trackTypst = true,
): FileDecision {
  let ignored = false;
  let typstAction: TypstAction | null = null;
  const matchedRules: TypstRule[] = [];

  for (const scope of scopes) {
    const relative = path.relative(scope.baseDir, absolutePath);

    if (
      relative === '' ||
      relative === '..' ||
      relative.startsWith(`..${path.sep}`) ||
      path.isAbsolute(relative)
    ) {
      continue;
    }

    const relativePosix = toPosix(relative);

    if (scope.ignore) {
      const result = scope.ignore.test(relativePosix);

      if (result.ignored) ignored = true;
      else if (result.unignored) ignored = false;
    }

    if (!trackTypst) continue;

    for (const rule of scope.typstRules) {
      if (rule.matcher.ignores(relativePosix)) {
        typstAction = rule.action;
        rule.hits += 1;
        matchedRules.push(rule);
      }
    }
  }

  if (trackTypst && path.extname(absolutePath).toLowerCase() === '.typ' && typstAction === null) {
    const basename = path.basename(absolutePath);

    if (basename.startsWith('_')) {
      typstAction =
        config.settings.underscoreAction === 'default'
          ? config.settings.defaultAction
          : config.settings.underscoreAction;
    } else {
      typstAction = config.settings.defaultAction;
    }
  }

  return { ignored, typstAction, matchedRules };
}

/**
 * Destination path of a typst source, relative to the staged tree root.
 * The leading `_` is a source-only marker and is removed from the output.
 */
export function typstOutputPath(
  relative: string,
  action: TypstAction,
  format: TypstFormat,
): string {
  if (action === 'ignore') {
    throw new Error(`[deploy] "${relative}" è ignorato e non produce un file.`);
  }

  const dir = path.posix.dirname(relative);
  const basename = path.posix.basename(relative);
  const extension = path.posix.extname(basename);
  const sourceStem = basename.slice(0, -extension.length);
  const stem = sourceStem.startsWith('_') ? sourceStem.slice(1) : sourceStem;

  if (!stem) {
    throw new Error(`[deploy] "${relative}" non produce un nome file valido.`);
  }

  const output = `${stem}.${action === 'compile' ? format : 'typ'}`;
  return dir === '.' ? output : `${dir}/${output}`;
}

export function assertAllTypstRulesUsed(config: DeployConfig) {
  const unused = config.scopes.flatMap((scope) =>
    scope.typstRules
      .filter((rule) => rule.hits === 0)
      .map((rule) => `${rule.label} (${scope.label})`),
  );

  if (unused.length > 0) {
    throw new Error(
      `[deploy] Regole typst senza file corrispondenti:\n${unused.map((entry) => `  - ${entry}`).join('\n')}\n` +
        'Controlla i glob o rimuovi le regole inutilizzate.',
    );
  }
}
