import { describe, expect, test } from 'bun:test';
import worker, { constantTimeEqual, parseBasicAuth } from './_worker.js';

const authorization = (user, password) =>
  `Basic ${btoa(`${user}:${password}`)}`;

const assets = {
  fetch: async () => new Response('asset body', { status: 200 }),
};

const env = {
  ADMIN_USER: 'admin',
  ADMIN_PASS: 'correct horse battery staple',
  ASSETS: assets,
};

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

describe('admin worker', () => {
  test('fails closed when credentials are not configured', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/'),
      { ASSETS: assets },
    );

    expect(response.status).toBe(503);
  });

  test('returns 401 without credentials', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/'),
      env,
    );

    expect(response.status).toBe(401);
    expect(response.headers.get('WWW-Authenticate')).toContain('Basic');
    expect(response.headers.get('Cache-Control')).toBe('no-store');
  });

  test('returns 401 with wrong credentials', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/', {
        headers: { Authorization: authorization('admin', 'wrong') },
      }),
      env,
    );

    expect(response.status).toBe(401);
  });

  test('serves the asset with correct credentials', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/admin/', {
        headers: { Authorization: authorization('admin', env.ADMIN_PASS) },
      }),
      env,
    );

    expect(response.status).toBe(200);
    expect(await response.text()).toBe('asset body');
    expect(response.headers.get('Cache-Control')).toBe('no-store');
    expect(response.headers.get('Vary')).toBe('Authorization');
  });

  test('redirects the admin root to /admin/', async () => {
    const response = await worker.fetch(
      new Request('https://admin.example/', {
        headers: { Authorization: authorization('admin', env.ADMIN_PASS) },
      }),
      env,
    );

    expect(response.status).toBe(302);
    expect(response.headers.get('Location')).toBe('https://admin.example/admin/');
  });
});
