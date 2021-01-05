FROM ubuntu:focal-20201106
MAINTAINER agh0st <ggg17226@gmail.com>
RUN \
bash -c "if [ `arch` == x86_64 ]; then \
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse\" > /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse\" >> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse\" >> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse\" >> /etc/apt/sources.list ;\
elif [ `arch` == aarch64 ]; then \
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse\" > /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse\" >> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse\" >> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse\" >> /etc/apt/sources.list ;\
fi ";\
apt-get update &&\
apt-get upgrade -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
dpkg-reconfigure --frontend noninteractive tzdata &&\
echo "LANG=en_US.UTF-8" > /etc/default/locale &&\
apt-get install -y vim htop net-tools psmisc wget curl git ca-certificates apt-utils libhugetlbfs-dev language-pack-zh-hans locales &&\
apt-get install -f &&\
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
locale-gen &&\
update-locale &&\
apt-get autoremove -y &&\
apt-get autoclean
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8