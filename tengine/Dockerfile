FROM agh0st/ubuntu:focal-20210729
WORKDIR /app
RUN \
    env DEBIAN_FRONTEND=noninteractive apt-get update &&\
    env DEBIAN_FRONTEND=noninteractive apt-get upgrade -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -y gcc g++ make cmake build-essential libtool-bin libjemalloc-dev  &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    cd /app &&\
    curl -L -o tengine.tar.gz https://tengine.taobao.org/download/tengine-2.3.3.tar.gz &&\
    tar xf tengine.tar.gz &&\
    curl -L -o ngx-cache-purge.tar.gz https://file.aghost.cn/source/ngx-cache-purge-2.3.tar.gz &&\
    tar xf ngx-cache-purge.tar.gz &&\
    mv ngx_cache_purge-2.3 ngx-cache-purge &&\
    curl -L -o ndk.tar.gz https://file.aghost.cn/source/ndk-0.3.1.tar.gz &&\
    tar xf ndk.tar.gz &&\
    mv ngx_devel_kit-0.3.1 ndk &&\
    curl -L -o echo.tar.gz https://file.aghost.cn/source/ngx-echo-0.62.tar.gz &&\
    tar xf echo.tar.gz &&\
    mv echo-nginx-module-0.62 echo &&\
    rm -rf /app/tengine.tar.gz /app/ngx-cache-purge.tar.gz /app/ndk.tar.gz /app/echo.tar.gz




CMD /bin/bash
