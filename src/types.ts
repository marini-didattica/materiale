/** A file or directory shown in the explorer. */
export interface FileEntry {
  name: string;
  kind: 'file' | 'directory';
  /** File size in bytes; null for directories. */
  size: number | null;
  /** Lowercase extension without the dot; null for directories. */
  extension: string | null;
  /** URL including the deployment base path. */
  href: string;
  /** Key in the page download tree; set for downloadable directories. */
  downloadKey?: string;
}

export interface BreadcrumbItem {
  label: string;
  href: string;
}

/** A file included in the client-side folder download. */
export interface DownloadFile {
  /** Path inside the zip, relative to the folder being downloaded. */
  name: string;
  /** Public URL of the file. */
  href: string;
  /** File size in bytes. */
  size: number;
}

/** Files to download for each directory under the current folder. */
export type DownloadTree = Record<string, DownloadFile[]>;

/** One entry of students.json, keyed by the folder under content/. */
export interface StudentRecord {
  /** Access code used in the explorer URL. */
  slug: string;
  /** Given names, one array element per name (no spaces). */
  'owner-first-names': string[];
  /** Family names, one array element per surname (no spaces). */
  'owner-last-names': string[];
  /** Optional lowercase display slug used in the breadcrumb (defaults to all names). */
  'owner-slug'?: string;
}

export type Students = Record<string, StudentRecord>;
