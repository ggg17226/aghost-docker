FROM agh0st/ubuntu:jammy-20230317-1315-CST
RUN \
    sed -i 's/mirrors.tuna.tsinghua.edu.cn/r720.aghost.cn/g' /etc/apt/sources.list &&\
    env DEBIAN_FRONTEND=noninteractive apt update &&\
    env DEBIAN_FRONTEND=noninteractive apt install -y openjdk-17-jre &&\
    env DEBIAN_FRONTEND=noninteractive apt install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    sed -i 's/r720.aghost.cn/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
