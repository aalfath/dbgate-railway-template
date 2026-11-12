# DbGate for Railway: the official image, pinned by version and digest, plus a small start script.
FROM dbgate/dbgate:7.3.5@sha256:e88589ff45f5de78ceb0925af8da693d112d0e6c9a5647f5e9e19ceb590dc1d5

COPY railway-start.sh /usr/local/bin/railway-start.sh
COPY railway-seed.js /usr/local/lib/railway-seed.js
RUN chmod 755 /usr/local/bin/railway-start.sh

# The image's entrypoint (docker-entrypoint.sh) stays; the start script runs DbGate's own
# /home/dbgate-docker/entrypoint.sh at the end.
CMD ["/bin/sh", "/usr/local/bin/railway-start.sh"]
