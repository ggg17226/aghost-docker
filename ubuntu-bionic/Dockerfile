FROM ubuntu:bionic-20200921
MAINTAINER agh0st <ggg17226@gmail.com>
RUN \
if [ `arch` == x86_64 ]; then \
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" > /tmp/sources.list ;\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /tmp/sources.list ;\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /tmp/sources.list ;\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /tmp/sources.list ;\
elif [ `arch` == aarch64 ]; then \
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse" > /tmp/sources.list ;\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse" >> /tmp/sources.list ;\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse" >> /tmp/sources.list ;\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse" >> /tmp/sources.list ;\
fi ;\
apt-get update &&\
apt-get upgrade -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
dpkg-reconfigure --frontend noninteractive tzdata &&\
apt-get install -y vim htop net-tools psmisc wget curl git ca-certificates apt-utils &&\
apt-get install -f &&\
apt-get autoremove -y &&\
apt-get autoclean 
