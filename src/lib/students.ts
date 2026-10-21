import type { StudentRecord } from '../types';

/** Full display name: all given names followed by all family names. */
export function studentFullName(student: StudentRecord): string {
  return [...student['owner-first-names'], ...student['owner-last-names']].join(' ');
}

/** First given name, used in the welcome title. */
export function studentFirstName(student: StudentRecord): string {
  return student['owner-first-names'][0] ?? '';
}

/** Lowercase ASCII slug part for a single name. */
export function slugifyName(value: string): string {
  return value
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

/**
 * Explicit owner slug, or the default built from all given and family names.
 * Example: ["Sara", "Maria"] + ["Docuz"] -> "sara-maria-docuz".
 */
export function studentOwnerSlug(student: StudentRecord): string {
  const explicit = student['owner-slug'];

  if (explicit !== undefined) {
    return explicit;
  }

  return [...student['owner-first-names'], ...student['owner-last-names']]
    .map(slugifyName)
    .filter(Boolean)
    .join('-');
}
