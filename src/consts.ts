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

/** Navigation links shared by every page. */
export const navLinks = [
  { href: PUBLIC_ROOT, label: 'Materiale pubblico' },
  { href: AREA_URL, label: 'Area riservata' },
  { href: MAIN_SITE_URL, label: 'Sito principale' },
];
