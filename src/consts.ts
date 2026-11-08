import { withBase } from './utils/base';

export const SITE_NAME = 'Marini didattica';
export const SITE_DESCRIPTION =
  'Materiale didattico pubblico e riservato: dispense, esercizi, verifiche e correzioni.';

/**
 * Cloudflare Pages hostnames.
 *
 * The project names are configured in the Cloudflare dashboard and in
 * `.github/workflows/deploy.yml`. If a `*.pages.dev` name is already taken,
 * change it there and update these constants to match.
 */
export const MAIN_SITE_URL = 'https://marini-didattica-site.pages.dev/';

/** Reserved-area access page hosted by the main didactic site. */
export const AREA_URL = 'https://marini-didattica-site.pages.dev/area-riservata/';

/** Cheating-graph viewer, available to teachers from the admin dashboard. */
export const CHECKER_URL = 'https://marini-didattica-checker.pages.dev/';

/** Browser root for public material. */
export const PUBLIC_ROOT = withBase('/public/');

/** Browser root for reserved material. */
export const PRIVATE_ROOT = withBase('/private/');

/** Raw file roots. Browsers link to files under these prefixes. */
export const RAW_PUBLIC_ROOT = withBase('/raw/public/');
export const RAW_PRIVATE_ROOT = withBase('/raw/private/');

/** Absolute URL of a section on the main didactic site. */
function mainSitePath(path: string): string {
  return new URL(path.replace(/^\/+/, ''), MAIN_SITE_URL).href;
}

/**
 * Navigation links shared by every page.
 *
 * The material site lives on its own Cloudflare Pages hostname; every entry
 * points at the canonical page on the main site.
 */
export const navLinks = [
  { href: MAIN_SITE_URL, label: 'Home' },
  { href: mainSitePath('prime/'), label: 'Prime' },
  { href: mainSitePath('seconde/'), label: 'Seconde' },
  { href: mainSitePath('olimpiadi/'), label: 'Olimpiadi' },
  { href: AREA_URL, label: 'Area riservata' },
];
