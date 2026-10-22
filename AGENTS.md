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

When starting the dev server from an agent, use background mode and manage it
with `astro dev stop`, `astro dev status`, and `astro dev logs`.

The site also has an unprotected admin browser at `/materiale/admin/` that
shows the public and private trees with their real folder names. It is built
from the same staged content as the public/private browsers.

## Content rules

- Public files go under `content/raw/public/`; reserved files under
  `content/raw/private/<class>/<student>/`.
- Add every private student folder to `content/students.json`; the build fails
  if a file under `content/raw/private/` is not covered by a listed folder.
- Do not edit `static/raw/`, `dist/`, or `.astro/`; they are generated.
- `.typ` sources are compiled to PDF. Prefix a source with `_` to publish it
  as-is instead.
- Never change an existing access code: links already distributed depend on it.

## Documentation

Full Astro documentation: https://docs.astro.build

Consult these guides before working on related tasks:

- [Adding pages, dynamic routes, or middleware](https://docs.astro.build/en/guides/routing/)
- [Working with Astro components](https://docs.astro.build/en/basics/astro-components/)
- [Adding or managing content](https://docs.astro.build/en/guides/content-collections/)
- [Adding styles or using Tailwind](https://docs.astro.build/en/guides/styling/)
