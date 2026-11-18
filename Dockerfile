# Flint image built from source: https://github.com/tatsoft/flint
# (a fork of lcy362/flint that adds the Arabic UI locale and RTL layout)
#
#   docker build -t flint:local .
#
# Multi-stage so the runtime image carries only compiled output + prod deps.
FROM node:22-alpine AS build
ARG FLINT_REPO=https://github.com/tatsoft/flint
ARG FLINT_REF=master
RUN apk add --no-cache git \
 && git clone --depth 1 -b "${FLINT_REF}" "${FLINT_REPO}" /repo
WORKDIR /repo
RUN npm ci && npm run build

FROM node:22-alpine
ENV NODE_ENV=production \
    PORT=8787 \
    FLINT_CONFIG=/config/config.json \
    FLINT_LOGS=/config/logs
WORKDIR /app
# server resolves the client bundle at ../../client/dist (i.e. /app/client/dist)
COPY --from=build /repo/server/dist ./server/dist
COPY --from=build /repo/client/dist ./client/dist
# production-only deps (the server needs express + yaml)
RUN mkdir -p /tmp/prod && cd /tmp/prod \
 && npm init -y >/dev/null 2>&1 \
 && npm install --omit=dev express@^4.19.2 yaml@^2.5.0 \
 && cp -r /tmp/prod/node_modules /app/node_modules
EXPOSE 8787
VOLUME ["/config"]
CMD ["node", "server/dist/index.js"]
