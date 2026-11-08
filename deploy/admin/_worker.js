/**
 * Cloudflare Pages advanced-mode worker for the admin deployment.
 *
 * The admin hostname is protected by a signed, HttpOnly session cookie created
 * by the Astro login page at `/login/`. Credentials come from the Pages project
 * environment:
 *
 *   ADMIN_USER  (text or secret)
 *   ADMIN_PASS  (secret)
 *
 * If either is missing the worker fails closed (503) instead of serving the
 * admin material. Basic authentication is still accepted for scripts and curl.
 *
 * This file is copied to `dist-admin/_worker.js` by `scripts/split-dist.ts`; it
 * is never part of the public deployment.
 */

const REALM = 'Marini didattica admin';
const COOKIE_NAME = '__Host-admin_session';
const SESSION_SECONDS = 12 * 60 * 60;
const LOGIN_PATH = '/login/';
const LOGIN_POST_PATH = '/__admin/login';
const LOGOUT_POST_PATH = '/__admin/logout';

/** Assets needed to render the login page before authentication. */
const PUBLIC_PREFIXES = ['/fonts/', '/_astro/'];
const PUBLIC_FILES = new Set(['/favicon.svg', '/favicon.ico']);

function securedHeaders(extra = {}) {
  return {
    'Cache-Control': 'no-store',
    'X-Robots-Tag': 'noindex, nofollow',
    ...extra,
  };
}

function toBase64Url(bytes) {
  let binary = '';

  for (const byte of bytes) binary += String.fromCharCode(byte);

  return btoa(binary).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

function fromBase64Url(value) {
  const base64 = value.replace(/-/g, '+').replace(/_/g, '/');
  const padded = base64.padEnd(Math.ceil(base64.length / 4) * 4, '=');
  const binary = atob(padded);

  return Uint8Array.from(binary, (character) => character.charCodeAt(0));
}

function encodeText(value) {
  return toBase64Url(new TextEncoder().encode(value));
}

function decodeText(value) {
  return new TextDecoder().decode(fromBase64Url(value));
}

/** Parse an `Authorization: Basic ...` header. Returns null when malformed. */
export function parseBasicAuth(header) {
  if (typeof header !== 'string') return null;

  const match = /^Basic\s+(\S+)$/i.exec(header.trim());

  if (!match) return null;

  let decoded;

  try {
    decoded = atob(match[1]);
  } catch {
    return null;
  }

  const separator = decoded.indexOf(':');

  if (separator < 0) return null;

  return {
    user: decoded.slice(0, separator),
    password: decoded.slice(separator + 1),
  };
}

/** Compare two strings without an early exit on the first different byte. */
export function constantTimeEqual(a, b) {
  if (typeof a !== 'string' || typeof b !== 'string') return false;

  let difference = a.length ^ b.length;
  const length = Math.max(a.length, b.length);

  for (let index = 0; index < length; index += 1) {
    difference |= (a.charCodeAt(index) || 0) ^ (b.charCodeAt(index) || 0);
  }

  return difference === 0;
}

/** Only allow local paths as post-login destinations. */
export function safeNext(value) {
  if (
    typeof value !== 'string' ||
    !value.startsWith('/') ||
    value.startsWith('//') ||
    value.includes('\\') ||
    /[\u0000-\u001f]/.test(value)
  ) {
    return '/admin/';
  }

  return value;
}

function getCookie(request, name) {
  const header = request.headers.get('Cookie');

  if (!header) return null;

  for (const part of header.split(';')) {
    const separator = part.indexOf('=');

    if (separator < 0) continue;

    if (part.slice(0, separator).trim() === name) {
      return part.slice(separator + 1).trim();
    }
  }

  return null;
}

async function sessionKey(password) {
  const digest = await crypto.subtle.digest(
    'SHA-256',
    new TextEncoder().encode(`admin-session:${password}`),
  );

  return crypto.subtle.importKey(
    'raw',
    digest,
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign', 'verify'],
  );
}

async function createSession(user, password) {
  const payload = encodeText(
    JSON.stringify({
      sub: user,
      exp: Math.floor(Date.now() / 1000) + SESSION_SECONDS,
    }),
  );
  const key = await sessionKey(password);
  const signature = new Uint8Array(
    await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(payload)),
  );

  return `${payload}.${toBase64Url(signature)}`;
}

async function verifySession(token, user, password) {
  if (typeof token !== 'string') return false;

  const separator = token.indexOf('.');

  if (separator <= 0) return false;

  const payload = token.slice(0, separator);
  const signature = token.slice(separator + 1);

  if (!payload || !signature) return false;

  let valid = false;

  try {
    const key = await sessionKey(password);

    valid = await crypto.subtle.verify(
      'HMAC',
      key,
      fromBase64Url(signature),
      new TextEncoder().encode(payload),
    );
  } catch {
    return false;
  }

  if (!valid) return false;

  try {
    const data = JSON.parse(decodeText(payload));

    return (
      data !== null &&
      typeof data === 'object' &&
      data.sub === user &&
      typeof data.exp === 'number' &&
      data.exp > Math.floor(Date.now() / 1000)
    );
  } catch {
    return false;
  }
}

function sessionCookie(token, maxAge) {
  return `${COOKIE_NAME}=${token}; Path=/; HttpOnly; Secure; SameSite=Strict; Max-Age=${maxAge}`;
}

function redirect(location, extra = {}) {
  return new Response(null, {
    status: 303,
    headers: securedHeaders({ Location: location, ...extra }),
  });
}

function unauthorized() {
  return new Response('Unauthorized', {
    status: 401,
    headers: securedHeaders({
      'WWW-Authenticate': `Basic realm="${REALM}", charset="UTF-8"`,
    }),
  });
}

function withSecuredHeaders(response) {
  const headers = new Headers(response.headers);

  headers.set('Cache-Control', 'no-store');
  headers.set('X-Robots-Tag', 'noindex, nofollow');
  headers.set('Vary', 'Cookie, Authorization');

  const body = response.status === 204 || response.status === 304 ? null : response.body;

  return new Response(body, {
    status: response.status,
    statusText: response.statusText,
    headers,
  });
}

function isPublicPath(pathname) {
  return (
    pathname === LOGIN_PATH ||
    PUBLIC_FILES.has(pathname) ||
    PUBLIC_PREFIXES.some((prefix) => pathname.startsWith(prefix))
  );
}

export default {
  async fetch(request, env) {
    const expectedUser = env.ADMIN_USER;
    const expectedPassword = env.ADMIN_PASS;

    if (!expectedUser || !expectedPassword) {
      return new Response('Admin authentication is not configured', {
        status: 503,
        headers: securedHeaders(),
      });
    }

    const url = new URL(request.url);
    const pathname = url.pathname;

    if (pathname === LOGIN_POST_PATH) {
      if (request.method !== 'POST') {
        return new Response('Method Not Allowed', {
          status: 405,
          headers: securedHeaders({ Allow: 'POST' }),
        });
      }

      const form = await request.formData().catch(() => null);

      if (!form) return redirect(`${LOGIN_PATH}?error=1`);

      const username = String(form.get('username') ?? '');
      const password = String(form.get('password') ?? '');
      const next = safeNext(String(form.get('next') ?? '/admin/'));

      if (
        constantTimeEqual(username, expectedUser) &&
        constantTimeEqual(password, expectedPassword)
      ) {
        const token = await createSession(expectedUser, expectedPassword);

        return redirect(next, {
          'Set-Cookie': sessionCookie(token, SESSION_SECONDS),
        });
      }

      return redirect(`${LOGIN_PATH}?error=1&next=${encodeURIComponent(next)}`);
    }

    if (pathname === LOGOUT_POST_PATH) {
      if (request.method !== 'POST') {
        return new Response('Method Not Allowed', {
          status: 405,
          headers: securedHeaders({ Allow: 'POST' }),
        });
      }

      return redirect(LOGIN_PATH, {
        'Set-Cookie': sessionCookie('', 0),
      });
    }

    if (pathname === '/login') {
      return redirect(LOGIN_PATH);
    }

    const basic = parseBasicAuth(request.headers.get('Authorization'));
    const basicOk =
      basic !== null &&
      constantTimeEqual(basic.user, expectedUser) &&
      constantTimeEqual(basic.password, expectedPassword);
    const session = getCookie(request, COOKIE_NAME);
    const sessionOk = session
      ? await verifySession(session, expectedUser, expectedPassword)
      : false;
    const authenticated = basicOk || sessionOk;

    if (pathname === LOGIN_PATH && authenticated) {
      return redirect('/admin/');
    }

    if (isPublicPath(pathname)) {
      const response = await env.ASSETS.fetch(request);

      return pathname === LOGIN_PATH ? withSecuredHeaders(response) : response;
    }

    if (!authenticated) {
      if (request.method === 'GET' || request.method === 'HEAD') {
        return redirect(
          `${LOGIN_PATH}?next=${encodeURIComponent(pathname + url.search)}`,
        );
      }

      return unauthorized();
    }

    if (pathname === '/') {
      return redirect('/admin/');
    }

    const response = await env.ASSETS.fetch(request);

    return withSecuredHeaders(response);
  },
};
