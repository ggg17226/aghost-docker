FROM agh0st/ubuntu:jammy-20230104-1338-CST
MAINTAINER agh0st <ggg17226@gmail.com>
WORKDIR /app
COPY run.sh /app/
RUN bash -c "if [ `arch` == x86_64 ]; then \
    curl -o /app/ssserver http://192.168.27.101/software/ss/amd64/ssserver; \
    curl -o /app/ssurl http://192.168.27.101/software/ss/amd64/ssurl; \
    elif [ `arch` == aarch64 ]; then \
    curl -o /app/ssserver http://192.168.27.101/software/ss/arm64/ssserver; \
    curl -o /app/ssurl http://192.168.27.101/software/ss/arm64/ssurl; \
    fi ";chmod 755 /app/ssserver /app/ssurl /app/run.sh && \
    env DEBIAN_FRONTEND=noninteractive apt update &&\
    env DEBIAN_FRONTEND=noninteractive apt install -y libev-dev libc-ares-dev libsodium-dev libmbedcrypto7  &&\
    env DEBIAN_FRONTEND=noninteractive apt install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt upgrade -y &&\
    env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/*

CMD /bin/bash /app/run.sh