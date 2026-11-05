// @ts-check
import { createReadStream } from 'node:fs';
import tailwindcss from '@tailwindcss/vite';
import { defineConfig } from 'astro/config';

const sharedFontName = '/inter-latin-wght-normal.woff2';
const sharedFontFile = new URL(
  './node_modules/@fontsource-variable/inter/files/inter-latin-wght-normal.woff2',
  import.meta.url,
);

/**
 * Inter is served by the main deployment from `/fonts/`, the only URL both
 * sites can share. During local development that path is outside this
 * deployment's base, so Astro's dev server would 404 it. Serve the packaged
 * copy at the same origin path instead. Production builds skip this plugin and
 * load the main deployment's file.
 */
function devSharedFont() {
  return {
    name: 'dev-shared-font',
    apply: 'serve',
    configureServer(server) {
      server.middlewares.use('/fonts', (req, res, next) => {
        if (req.url?.split('?')[0] !== sharedFontName) {
          return next();
        }

        res.setHeader('Content-Type', 'font/woff2');
        res.setHeader('Cache-Control', 'no-cache');
        createReadStream(sharedFontFile).on('error', next).pipe(res);
      });
    },
  };
}

// https://astro.build/config
export default defineConfig({
  // Deployed as a GitHub Pages project site at
  // https://marini-didattica.github.io/materiale/
  site: 'https://marini-didattica.github.io',
  base: '/materiale',
  trailingSlash: 'always',
  // Inline the (small) stylesheet into every page. Firefox can paint the HTML
  // before an external stylesheet finishes loading, which shows the raw,
  // unstyled page for a frame or two. Inlining removes that request entirely.
  build: {
    inlineStylesheets: 'always',
  },
  // `static/` is the Astro public directory. The content build stages the
  // browsable raw files under `static/raw/{public,private}`; the generated
  // directory pages live under `src/pages/{public,private}` and are rendered
  // to the matching URLs.
  publicDir: './static',
  vite: {
    plugins: [devSharedFont(), tailwindcss()],
  },
});
