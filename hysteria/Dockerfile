FROM agh0st/ubuntu:jammy-20230104-1338-CST
MAINTAINER agh0st <ggg17226@gmail.com>
WORKDIR /app
RUN \
    env DEBIAN_FRONTEND=noninteractive apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get upgrade -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    bash -c "cd /tmp;\
        if [ `arch` == x86_64 ]; then \
          wget https://file.aghost.cn/software/hy-conf-generator/linux-amd64/hy-conf-generator;\
          wget https://file.aghost.cn/software/hysteria/linux-amd64/hysteria;\
        elif [ `arch` == aarch64 ]; then \
          wget https://file.aghost.cn/software/hy-conf-generator/linux-arm64/hy-conf-generator;\
          wget https://file.aghost.cn/software/hysteria/linux-arm64/hysteria;\
        fi ";\
    mv /tmp/hysteria /app/ && chmod 755 /app/hysteria; \
    mv /tmp/hy-conf-generator /app/ && chmod 755 /app/hy-conf-generator

CMD /bin/bash -c "/app/hy-conf-generator > /app/config.json && /app/hysteria -c /app/config.json ${RUN_MODE:-server}"