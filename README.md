# DbGate on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/dbgate-1?utm_medium=integration&utm_source=button&utm_campaign=dbgate)

Railway template for [DbGate](https://github.com/dbgate/dbgate), a web database client for PostgreSQL, MySQL, MariaDB, SQL Server, MongoDB, Redis, SQLite and more.

## What it deploys

- **DbGate**, built from this repo's `Dockerfile`:
  - DbGate **7.3.6**, the official image pinned by digest: `dbgate/dbgate:7.3.6@sha256:adb32bb7e0de948d1ffccbc9639014741e1f6d750f7fddd800af651777922953`.
  - A Railway volume at `/root/.dbgate` for settings, saved connections, scripts and archives.
  - A Railway domain, health check `/health` and restart on failure, set in the Railway template (this repo has no `railway.json`).
- **Postgres**: Railway's own Postgres 18 with its volume, reachable only over the private network.

`railway-start.sh` refuses to start DbGate when `PASSWORD` is empty, so DbGate never runs without a login. On the first start it saves the bundled Postgres (`POSTGRES_URL`) as an ordinary DbGate connection called "Railway Postgres". You can edit or delete it and add your own connections.

## Variables

| Service | Variable | Default in the template | Description |
|---|---|---|---|
| DbGate | `LOGIN` | `admin` | Username for the DbGate login |
| DbGate | `PASSWORD` | `${{secret(32)}}` (generated) | Password for the DbGate login. DbGate won't start without it |
| DbGate | `POSTGRES_URL` | `${{Postgres.DATABASE_URL}}` | Saved as a DbGate connection on the first start. Remove it to skip |
| DbGate | `PORT` | `3000` | Port DbGate listens on |

**Logging in:** open the Railway URL and sign in with `LOGIN` and `PASSWORD` from the DbGate service's variables. Change either and redeploy to change the login.

## Updates

Projects deployed from the template build from this repo's `main` branch. When a new version is merged to `main`, Railway shows those projects an "update available" notice, and each owner chooses when to apply it. Your connections and settings stay on the volume. Every version is listed in [CHANGELOG.md](CHANGELOG.md), with breaking changes first.
