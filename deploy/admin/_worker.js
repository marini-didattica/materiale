/**
 * Cloudflare Pages advanced-mode worker for the admin deployment.
 *
 * The whole admin hostname is protected by HTTP Basic authentication. The
 * credentials come from the Pages project environment:
 *
 *   ADMIN_USER  (text or secret)
 *   ADMIN_PASS  (secret)
 *
 * If either is missing the worker fails closed (503) instead of serving the
 * admin material. This file is copied to `dist-admin/_worker.js` by
 * `scripts/split-dist.ts`; it is never part of the public deployment.
 */

const REALM = 'Marini didattica admin';

function securedHeaders(extra = {}) {
  return {
    'Cache-Control': 'no-store',
    'X-Robots-Tag': 'noindex, nofollow',
    ...extra,
  };
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
  headers.set('Vary', 'Authorization');

  const body = response.status === 204 || response.status === 304 ? null : response.body;

  return new Response(body, {
    status: response.status,
    statusText: response.statusText,
    headers,
  });
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

    const credentials = parseBasicAuth(request.headers.get('Authorization'));

    if (
      !credentials ||
      !constantTimeEqual(credentials.user, expectedUser) ||
      !constantTimeEqual(credentials.password, expectedPassword)
    ) {
      return unauthorized();
    }

    const url = new URL(request.url);

    // The admin deployment is a full copy of the material site; send its root
    // to the admin browser instead of the public landing page.
    if (url.pathname === '/') {
      return Response.redirect(new URL('/admin/', url).toString(), 302);
    }

    const response = await env.ASSETS.fetch(request);

    return withSecuredHeaders(response);
  },
};
