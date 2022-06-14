FROM agh0st/ubuntu:jammy-20220601-1806-CST
MAINTAINER agh0st <ggg17226@gmail.com>
WORKDIR /app
COPY ss-server /app/
COPY run.sh /app/
RUN chmod 755 /app/ss-server /app/run.sh && \
env DEBIAN_FRONTEND=noninteractive apt update &&\
env DEBIAN_FRONTEND=noninteractive apt install -y libev4 libc-ares2 libsodium23 libmbedcrypto3  &&\
env DEBIAN_FRONTEND=noninteractive apt install -f &&\
env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*

CMD /bin/bash /app/run.sh