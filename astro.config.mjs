// @ts-check
import tailwindcss from '@tailwindcss/vite';
import { defineConfig } from 'astro/config';

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
    plugins: [tailwindcss()],
  },
});
