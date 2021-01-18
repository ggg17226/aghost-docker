#!/usr/bin/env bash
cd /app
./ss-server \
-s "${SS_SERVER_HOST:-0.0.0.0}" \
-p ${SS_SERVER_PORT:-14444} \
-m "${SS_SERVER_METHOD:-xchacha20-ietf-poly1305}" \
-k "${SS_SERVER_PASSWORD:-$HOSTNAME}" \
-t ${SS_SERVER_TIMEOUT:-600} \
-n ${SS_SERVER_OPEN_FILE_LIMIT:-32767} \
--no-delay ${SS_SERVER_DNS_ARGS} \
${SS_SERVER_EXT_ARGS}