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
 * Inter is served from `/fonts/` by this deployment (the file lives in
 * `static/fonts/`). During local development the plugin below serves the
 * packaged copy at the same path, so the font is always available even if
 * `static/fonts/` has not been populated.
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
  // Deployed as a Cloudflare Pages project at
  // https://materiale.didattica.mattia-marini.com/
  site: 'https://materiale.didattica.mattia-marini.com',
  base: '/',
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
