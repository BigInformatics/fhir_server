#!/usr/bin/env sh
set -e

cd /usr/src/medplum

if [ -f ".env" ]; then
  echo "Loading environment from .env"
  set -a
  # shellcheck source=/dev/null
  . ".env"
  set +a
fi

if [ -n "${MEDPLUM_CONFIG_PATH}" ]; then
  echo "Config file found, running with custom config: ${MEDPLUM_CONFIG_PATH}"
  exec node --require ./packages/server/dist/otel/instrumentation.js \
    packages/server/dist/index.js "file:${MEDPLUM_CONFIG_PATH}"
else
  echo "No config file found, running with default env settings"
  exec node --require ./packages/server/dist/otel/instrumentation.js \
    packages/server/dist/index.js env
fi
