#!/usr/bin/env bash
cd /app
./ss-server \
--server-addr "${SS_SERVER_HOST:-[::]}:${SS_SERVER_PORT:-14444}" \
--encrypt-method "${SS_SERVER_METHOD:-xchacha20-ietf-poly1305}" \
--password "${SS_SERVER_PASSWORD:-$HOSTNAME}" \
--timeout ${SS_SERVER_TIMEOUT:-600} \
--nofile ${SS_SERVER_OPEN_FILE_LIMIT:-32767} \
--tcp-no-delay \
${SS_SERVER_DNS_ARGS} \
${SS_SERVER_EXT_ARGS}