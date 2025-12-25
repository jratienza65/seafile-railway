#!/bin/sh

set -euo pipefail

export SEAFILE_EXTERNAL_DOMAIN=${SEAFILE_EXTERNAL_DOMAIN}

export SEAFILE_DOMAIN=${SEAFILE_DOMAIN:-${SEAFILE_HOST%:*}}
export SEAFILE_PORT=${SEAFILE_PORT:-${SEAFILE_HOST##*:}}

export SEADOC_DOMAIN=${SEADOC_DOMAIN:-${SEADOC_HOST%:*}}
export SEADOC_PORT=${SEADOC_PORT:-${SEADOC_HOST##*:}}

SEAFILE_DOMAIN=${SEAFILE_DOMAIN##*://}
SEADOC_DOMAIN=${SEADOC_DOMAIN##*://}

echo using seafile: ${SEAFILE_DOMAIN} with port: ${SEAFILE_PORT}
echo using seadoc: ${SEADOC_DOMAIN} with port: ${SEADOC_PORT}

exec caddy run --config Caddyfile --adapter caddyfile 2>&1
