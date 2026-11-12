// Prints one DbGate connection (connections.jsonl line) for the Postgres in POSTGRES_URL.
const u = new URL(process.env.POSTGRES_URL);
console.log(JSON.stringify({
  _id: 'railway-postgres',
  displayName: 'Railway Postgres',
  engine: 'postgres@dbgate-plugin-postgres',
  server: u.hostname,
  port: u.port || '5432',
  user: decodeURIComponent(u.username),
  password: decodeURIComponent(u.password),
  defaultDatabase: u.pathname.slice(1),
}));
