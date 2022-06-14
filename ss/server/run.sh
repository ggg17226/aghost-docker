#!/usr/bin/env bash
cd /app
./ss-server \
--server-addr "${SS_SERVER_HOST:-[::]}:${SS_SERVER_PORT:-14444}" \
--encrypt-method "${SS_SERVER_METHOD:-xchacha20-ietf-poly1305}" \
--password "${SS_SERVER_PASSWORD:-$HOSTNAME}" \
--timeout ${SS_SERVER_TIMEOUT:-60} \
--nofile ${SS_SERVER_OPEN_FILE_LIMIT:-32767} \
--tcp-no-delay --tcp-fast-open \
--tcp-keep-alive ${SS_SERVER_KEEPALIVE_TIMEOUT:-180} \
${SS_SERVER_MODE:--U} \
${SS_SERVER_DNS_ARGS} \
${SS_SERVER_EXT_ARGS}