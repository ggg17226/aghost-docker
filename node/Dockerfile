FROM node:16.20.0-bullseye
MAINTAINER agh0st <ggg17226@gmail.com>
RUN \
bash -c "echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free\" > /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free\" >> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free\" >> /etc/apt/sources.list;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian-security/ bullseye/updates main contrib non-free\" >> /etc/apt/sources.list ;";\
bash -c "\
env DEBIAN_FRONTEND=noninteractive apt update && env DEBIAN_FRONTEND=noninteractive apt upgrade -y &&\
 env DEBIAN_FRONTEND=noninteractive apt install -y tzdata &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata &&\
echo \"LANG=en_US.UTF-8\" > /etc/default/locale  &&\
env DEBIAN_FRONTEND=noninteractive apt install -y vim htop net-tools psmisc wget curl git ca-certificates apt-utils libhugetlbfs-dev xfonts-intl-chinese xfonts-intl-chinese-big locales &&\
env DEBIAN_FRONTEND=noninteractive apt install -f &&\
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
locale-gen &&\
update-locale &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8