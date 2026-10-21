/** Deployment base path with a guaranteed trailing slash, e.g. "/" or "/slide-site/". */
export const base = import.meta.env.BASE_URL.endsWith('/')
  ? import.meta.env.BASE_URL
  : `${import.meta.env.BASE_URL}/`;

/** Prefix a root-relative path with the deployment base. */
export function withBase(path: string): string {
  return `${base}${path.replace(/^\/+/, '')}`;
}
