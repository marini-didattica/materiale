/** Encode each segment of a relative path for use in an href. */
export function encodePath(relativePath: string): string {
  return relativePath
    .split('/')
    .filter(Boolean)
    .map((segment) => encodeURIComponent(segment))
    .join('/');
}

/** Join non-empty relative path segments with a forward slash. */
export function joinPath(...parts: Array<string | undefined>): string {
  return parts.filter((part): part is string => Boolean(part)).join('/');
}
