FROM agh0st/ubuntu:focal-20210107
MAINTAINER agh0st <ggg17226@gmail.com>
WORKDIR /app
COPY ss-server /app/
RUN chmod 755 /app/ss-server && \
env DEBIAN_FRONTEND=noninteractive apt update &&\
env DEBIAN_FRONTEND=noninteractive apt install -y libev4 libc-ares2 libsodium23 libmbedcrypto3  &&\
env DEBIAN_FRONTEND=noninteractive apt install -f &&\
env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*

CMD \
export SS_SERVER_RUN_ARGS=" -s \"${SS_SERVER_HOST:-0.0.0.0}\" -p ${SS_SERVER_PORT:-14444} "&&\
export SS_SERVER_RUN_ARGS="$SS_SERVER_RUN_ARGS -m \"${SS_SERVER_METHOD:-xchacha20-ietf-poly1305}\" -k \"${SS_SERVER_PASSWORD:-$HOSTNAME}\" "&&\
export SS_SERVER_RUN_ARGS="$SS_SERVER_RUN_ARGS -t ${SS_SERVER_TIMEOUT:-600} -n ${SS_SERVER_OPEN_FILE_LIMIT:-32767} "&&\
export SS_SERVER_RUN_ARGS="$SS_SERVER_RUN_ARGS --no-delay $SS_SERVER_DNS_ARGS "&&\
echo /app/ss-server ${SS_SERVER_RUN_ARGS} ${SS_SERVER_EXT_ARGS} > /tmp/start_cmd && /bin/bash /tmp/start_cmd