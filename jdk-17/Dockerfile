FROM agh0st/ubuntu:focal-20220319-0943-CST
RUN env DEBIAN_FRONTEND=noninteractive apt-get update &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-17-jdk &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*
