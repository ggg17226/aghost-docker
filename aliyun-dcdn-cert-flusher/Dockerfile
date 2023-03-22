FROM agh0st/ubuntu:jammy-20230317-1315-CST
MAINTAINER agh0st <ggg17226@gmail.com>
WORKDIR /app
RUN \
    env DEBIAN_FRONTEND=noninteractive apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get upgrade -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    mkdir -p /app &&\
    bash -c "cd /tmp;\
        if [ `arch` == x86_64 ]; then \
          wget http://r720.aghost.cn/files/software/aliyun-dcdn-cert-flusher/linux-amd64/aliyun-dcdn-cert-flusher -O /bin/aliyun-dcdn-cert-flusher;\
        elif [ `arch` == aarch64 ]; then \
          wget http://r720.aghost.cn/files/software/aliyun-dcdn-cert-flusher/linux-arm64/aliyun-dcdn-cert-flusher -O /bin/aliyun-dcdn-cert-flusher;\
        fi ";\
   chmod 755 /bin/aliyun-dcdn-cert-flusher;

CMD /bin/bash -c "cd ${WORK_DIR:-/app}&&/bin/aliyun-dcdn-cert-flusher"