import { describe, expect, test } from 'bun:test';
import worker, {
  constantTimeEqual,
  parseBasicAuth,
  safeNext,
} from './_worker.js';

const PASSWORD = 'correct horse battery staple';

const assets = {
  fetch: async () => new Response('asset body', { status: 200 }),
};

const env = {
  ADMIN_USER: 'admin',
  ADMIN_PASS: PASSWORD,
  ASSETS: assets,
};

const authorization = (user, password) =>
  `Basic ${btoa(`${user}:${password}`)}`;

const loginRequest = (fields) =>
  new Request('https://admin.example/__admin/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams(fields),
  });

async function login() {
  const response = await worker.fetch(
    loginRequest({
      username: env.ADMIN_USER,
      password: env.ADMIN_PASS,
      next: '/admin/',
    }),
    env,
  );

  const cookie = response.headers.get('Set-Cookie');

  if (!cookie) throw new Error('missing session cookie');

  return cookie.split(';')[0];
}

describe('parseBasicAuth', () => {
  test('parses user and password', () => {
    expect(parseBasicAuth(authorization('admin', 'secret'))).toEqual({
      user: 'admin',
      password: 'secret',
    });
  });

  test('keeps colons in the password', () => {
    expect(parseBasicAuth(authorization('admin', 'a:b:c'))).toEqual({
      user: 'admin',
      password: 'a:b:c',
    });
  });

  test('rejects other schemes and malformed values', () => {
    expect(parseBasicAuth('Bearer token')).toBeNull();
    expect(parseBasicAuth('Basic')).toBeNull();
    expect(parseBasicAuth(null)).toBeNull();
    expect(parseBasicAuth('Basic !!!')).toBeNull();
  });
});

describe('constantTimeEqual', () => {
  test('compares strings', () => {
    expect(constantTimeEqual('abc', 'abc')).toBe(true);
    expect(constantTimeEqual('abc', 'abd')).toBe(false);
    expect(constantTimeEqual('abc', 'abcd')).toBe(false);
  });
});

describe('safeNext', () => {
  test('allows local paths only', () => {
    expect(safeNext('/admin/')).toBe('/admin/');
    expect(safeNext('/raw/private/x')).toBe('/raw/private/x');
    expect(safeNext('//evil.example')).toBe('/admin/');
    expect(safeNext('https://evil.example')).toBe('/admin/');
    expect(safeNext('\\\\evil')).toBe('/admin/');
  });
});

describe('admin worker', () => {
  test('fails closed when credentials are not configured', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/login/'),
      { ASSETS: assets },
    );

    expect(response.status).toBe(503);
  });

  test('serves the login page and its assets without a session', async () => {
    const loginPage = await worker.fetch(
      new Request('https://admin.example/login/'),
      env,
    );
    expect(loginPage.status).toBe(200);
    expect(loginPage.headers.get('Cache-Control')).toBe('no-store');

    const font = await worker.fetch(
      new Request('https://admin.example/fonts/inter.woff2'),
      env,
    );
    expect(font.status).toBe(200);
  });

  test('redirects /login to /login/', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/login'),
      env,
    );

    expect(response.status).toBe(303);
    expect(response.headers.get('Location')).toBe('/login/');
  });

  test('redirects unauthenticated visits to the styled login page', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/'),
      env,
    );

    expect(response.status).toBe(303);
    expect(response.headers.get('Location')).toBe('/login/?next=%2Fadmin%2F');
  });

  test('returns 401 for unauthenticated non-GET requests', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/', { method: 'POST' }),
      env,
    );

    expect(response.status).toBe(401);
    expect(response.headers.get('WWW-Authenticate')).toContain('Basic');
  });

  test('rejects wrong credentials and preserves the next path', async () => {
    const response = await worker.fetch(
      loginRequest({
        username: 'admin',
        password: 'wrong',
        next: '/admin/private/',
      }),
      env,
    );

    expect(response.status).toBe(303);
    expect(response.headers.get('Location')).toBe(
      '/login/?error=1&next=%2Fadmin%2Fprivate%2F',
    );
  });

  test('accepts safe local next paths and rejects open redirects', async () => {
    const local = await worker.fetch(
      loginRequest({
        username: 'admin',
        password: env.ADMIN_PASS,
        next: '/admin/private/',
      }),
      env,
    );
    expect(local.headers.get('Location')).toBe('/admin/private/');

    const external = await worker.fetch(
      loginRequest({
        username: 'admin',
        password: env.ADMIN_PASS,
        next: '//evil.example',
      }),
      env,
    );
    expect(external.headers.get('Location')).toBe('/admin/');
  });

  test('serves the admin asset with a valid session', async () => {
    const cookie = await login();
    const response = await worker.fetch(
      new Request('https://admin.example/admin/', {
        headers: { Cookie: cookie },
      }),
      env,
    );

    expect(response.status).toBe(200);
    expect(await response.text()).toBe('asset body');
    expect(response.headers.get('Cache-Control')).toBe('no-store');
    expect(response.headers.get('Vary')).toBe('Cookie, Authorization');
  });

  test('redirects the admin root to /admin/ with a valid session', async () => {
    const cookie = await login();
    const response = await worker.fetch(
      new Request('https://admin.example/', {
        headers: { Cookie: cookie },
      }),
      env,
    );

    expect(response.status).toBe(303);
    expect(response.headers.get('Location')).toBe('/admin/');
  });

  test('still accepts Basic authentication for scripts', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/', {
        headers: {
          Authorization: authorization(env.ADMIN_USER, env.ADMIN_PASS),
        },
      }),
      env,
    );

    expect(response.status).toBe(200);
  });

  test('rejects a tampered session cookie', async () => {
    const cookie = await login();
    const tampered = `${cookie.slice(0, -1)}${cookie.endsWith('A') ? 'B' : 'A'}`;
    const response = await worker.fetch(
      new Request('https://admin.example/admin/', {
        headers: { Cookie: tampered },
      }),
      env,
    );

    expect(response.status).toBe(303);
    expect(response.headers.get('Location')).toBe('/login/?next=%2Fadmin%2F');
  });

  test('logout clears the session', async () => {
    const cookie = await login();
    const response = await worker.fetch(
      new Request('https://admin.example/__admin/logout', {
        method: 'POST',
        headers: { Cookie: cookie },
      }),
      env,
    );

    expect(response.status).toBe(303);
    expect(response.headers.get('Location')).toBe('/login/');
    expect(response.headers.get('Set-Cookie')).toContain('Max-Age=0');
  });
});
