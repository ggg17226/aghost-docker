FROM agh0st/ubuntu:jammy-20230519-1054-CST
RUN \
    sed -i 's/mirrors.tuna.tsinghua.edu.cn/r730.aghost.cn/g' /etc/apt/sources.list &&\
    env DEBIAN_FRONTEND=noninteractive apt-get update &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-8-jdk &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    sed -i 's/r730.aghost.cn/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
