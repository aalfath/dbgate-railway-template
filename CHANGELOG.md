# Changelog

Each entry is one version of this Railway template. Breaking changes are listed first.
Read the entry before you apply an update in Railway.

## 7.3.6-1 (2026-11-17)

- No breaking changes. Saved connections and settings on the `/root/.dbgate` volume are kept.
- DbGate [7.3.6](https://github.com/dbgate/dbgate/releases/tag/v7.3.6) (maintenance release).
- Image: `dbgate/dbgate:7.3.6@sha256:adb32bb7e0de948d1ffccbc9639014741e1f6d750f7fddd800af651777922953`.

## 7.3.5-2 (2026-11-15)

- README: the Deploy on Railway button links to the published template (`dbgate-1`). No change to the running service.

## 7.3.5-1 (2026-11-12)

- First version: DbGate 7.3.5 (`dbgate/dbgate:7.3.5@sha256:e88589ff45f5de78ceb0925af8da693d112d0e6c9a5647f5e9e19ceb590dc1d5`).
- Login is always on: `LOGIN` (default `admin`) and a generated `PASSWORD`; the service refuses to start with an empty password.
- On the first start, saves the bundled Railway Postgres as a "Railway Postgres" connection.
- Health check `/health` and restart on failure are set in the Railway template, not in a `railway.json`.
- README: Deploy on Railway button.
