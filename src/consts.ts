import { withBase } from './utils/base';

export const SITE_NAME = 'Marini didattica';
export const SITE_DESCRIPTION =
  'Materiale didattico pubblico e riservato: dispense, esercizi, verifiche e correzioni.';

/** Public landing page of the main didactic site. */
export const MAIN_SITE_URL = 'https://marini-didattica.github.io/';

/** Reserved-area access page hosted by the main didactic site. */
export const AREA_URL = 'https://marini-didattica.github.io/area-riservata/';

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
 * Kept identical to the main site's navbar: the material site is part of the
 * same site, so every entry points at the canonical page there.
 */
export const navLinks = [
  { href: MAIN_SITE_URL, label: 'Home' },
  { href: mainSitePath('prime/'), label: 'Prime' },
  { href: mainSitePath('seconde/'), label: 'Seconde' },
  { href: mainSitePath('olimpiadi/'), label: 'Olimpiadi' },
  { href: AREA_URL, label: 'Area riservata' },
];
