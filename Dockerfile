# DbGate for Railway: the official image, pinned by version and digest, plus a small start script.
FROM dbgate/dbgate:7.3.6@sha256:adb32bb7e0de948d1ffccbc9639014741e1f6d750f7fddd800af651777922953

COPY railway-start.sh /usr/local/bin/railway-start.sh
COPY railway-seed.js /usr/local/lib/railway-seed.js
RUN chmod 755 /usr/local/bin/railway-start.sh

# The image's entrypoint (docker-entrypoint.sh) stays; the start script runs DbGate's own
# /home/dbgate-docker/entrypoint.sh at the end.
CMD ["/bin/sh", "/usr/local/bin/railway-start.sh"]
