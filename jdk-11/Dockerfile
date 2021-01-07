FROM agh0st/ubuntu:focal-20210105
RUN env DEBIAN_FRONTEND=noninteractive apt update &&\
env DEBIAN_FRONTEND=noninteractive apt install -y openjdk-11-jdk &&\
env DEBIAN_FRONTEND=noninteractive apt install -f &&\
env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*
