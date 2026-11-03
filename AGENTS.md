# Development

## Setup

```sh
bun install
git submodule update --init --recursive
```

Typst `0.15.1` must be available in `PATH` for `content:build`.

## Commands

- `bun run dev` — build content, then start Astro at `http://localhost:4321/materiale/`.
- `bun run build` — validate content, compile Typst, and build `dist/`.
- `bun run content:build` — only validate/stage/compile content into `static/raw/`.
- `bun test` — run the content/deploy config tests.

When starting the dev server from an agent, use background mode and manage it
with `astro dev stop`, `astro dev status`, and `astro dev logs`.

The site also has an unprotected admin browser at `/materiale/admin/` that
shows the public and private trees with their real folder names. It is built
from the same staged content as the public/private browsers.

Pages use Astro's `ClientRouter`, so client scripts run once: re-bind them on
`astro:page-load`. Links that leave this deployment (the main site) must use
`data-astro-reload` to avoid mixing the two Astro runtimes.

## Content rules

- Public files go under `content/raw/public/`; reserved files under
  `content/raw/private/<class>/<student>/`.
- Add every private student folder to `content/students.json`; the build fails
  if a file under `content/raw/private/` is not covered by a listed folder.
- Do not edit `static/raw/`, `dist/`, or `.astro/`; they are generated.
- `.typ` sources are compiled to PDF. Prefix a source with `_` to publish it
  as-is instead.
- Deployment is configured by `content/deploy.toml` (global settings and root
  rules) and by optional `deploy.toml` files inside `content/raw/` (local rules,
  relative to their folder, applying recursively).
- Local `deploy.toml` files may contain only `[ignore]` and
  `[[typst.override]]`; `default_action`, `underscore_action` and `format` belong
  in `content/deploy.toml`.
- Typst override actions are `compile`, `publish` and `ignore`. An override
  matching no file, or two sources producing the same output, fails the build.
- Never change an existing access code: links already distributed depend on it.

## Documentation

Full Astro documentation: https://docs.astro.build

Consult these guides before working on related tasks:

- [Adding pages, dynamic routes, or middleware](https://docs.astro.build/en/guides/routing/)
- [Working with Astro components](https://docs.astro.build/en/basics/astro-components/)
- [Adding or managing content](https://docs.astro.build/en/guides/content-collections/)
- [Adding styles or using Tailwind](https://docs.astro.build/en/guides/styling/)
