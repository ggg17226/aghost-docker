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
    wget https://tengine.taobao.org/download/tengine-2.3.3.tar.gz &&\
    tar xf tengine-2.3.3.tar.gz &&\
    curl ${CURL_PSTR} -L -o /app/http-subs-filter.tar.gz https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/refs/tags/v0.6.4.tar.gz &&\
    tar xf http-subs-filter.tar.gz &&\
    mv ngx_http_substitutions_filter_module-0.6.4 http-subs-filter


CMD /bin/bash
