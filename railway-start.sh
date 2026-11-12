#!/bin/sh
# Start script for DbGate on Railway.
# - Refuses to start without a password, because DbGate would otherwise run with no login.
# - On the first start, saves the Railway Postgres from POSTGRES_URL as an ordinary
#   DbGate connection, so users can still edit it and add their own connections.
set -e

export PORT="${PORT:-3000}"
export LOGIN="${LOGIN:-admin}"

if [ -z "$PASSWORD" ]; then
  echo "PASSWORD is empty: refusing to start DbGate without a login" >&2
  exit 1
fi

DATA_DIR=/root/.dbgate
mkdir -p "$DATA_DIR"

if [ -n "$POSTGRES_URL" ] && [ ! -e "$DATA_DIR/connections.jsonl" ]; then
  node /usr/local/lib/railway-seed.js > "$DATA_DIR/connections.jsonl.tmp"
  mv "$DATA_DIR/connections.jsonl.tmp" "$DATA_DIR/connections.jsonl"
  echo "Seeded Railway Postgres connection"
fi

exec /home/dbgate-docker/entrypoint.sh
