FROM node:22-alpine

# Install Flint at build time so the container starts instantly and runs offline.
RUN npm install -g flint-skills-hub \
 && mkdir -p /config \
 && ln -sf /usr/local/bin/flint /usr/local/bin/flint-skills-hub

ENV PORT=8787 \
    FLINT_CONFIG=/config/config.json \
    FLINT_LOGS=/config/logs

EXPOSE 8787
VOLUME ["/config"]

# -f keeps Flint in the foreground so the container stays alive
CMD ["sh", "-c", "exec flint -f -p ${PORT}"]
