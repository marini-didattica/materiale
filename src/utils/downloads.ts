/** Turn a path segment into a safe, readable ZIP filename segment. */
export function toDownloadSegment(value: string): string {
  return (
    value
      .normalize('NFKD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase()
      .replace(/[^a-z0-9._-]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .slice(0, 60) || 'materiale'
  );
}

/** Build a friendly ZIP filename from path segments. */
export function buildZipName(parts: string[]): string {
  return `${parts.map(toDownloadSegment).join('-')}.zip`;
}
