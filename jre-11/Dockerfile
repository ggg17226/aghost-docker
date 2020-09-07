from ubuntu:bionic-20200807
MAINTAINER agh0st <ggg17226@gmail.com>
run echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list &&\
apt-get update &&\
apt-get upgrade -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
dpkg-reconfigure --frontend noninteractive tzdata &&\
apt-get install -y vim htop net-tools psmisc wget curl git ca-certificates apt-utils openjdk-11-jre &&\
apt-get install -f &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
java -version
