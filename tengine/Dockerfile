FROM agh0st/ubuntu:focal-20210729
WORKDIR /app
RUN \
    env DEBIAN_FRONTEND=noninteractive apt-get update &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -y gcc g++ make cmake build-essential libtool-bin libjemalloc-dev  &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    cd /app &&\
    wget https://tengine.taobao.org/download/tengine-2.3.3.tar.gz &&\
    tar xf tengine-2.3.3.tar.gz


CMD /bin/bash
