const units = ['B', 'KB', 'MB', 'GB'];

/** Format a byte count for display in Italian. */
export function formatBytes(bytes: number): string {
  if (!Number.isFinite(bytes) || bytes < 0) return '—';

  if (bytes < 1024) {
    return `${new Intl.NumberFormat('it-IT').format(bytes)} B`;
  }

  let value = bytes;
  let unitIndex = 0;

  while (value >= 1024 && unitIndex < units.length - 1) {
    value /= 1024;
    unitIndex += 1;
  }

  return `${new Intl.NumberFormat('it-IT', { maximumFractionDigits: 1 }).format(value)} ${
    units[unitIndex]
  }`;
}
