from ubuntu:bionic-20191029
run echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list &&\
apt-get update &&\
apt-get upgrade -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
dpkg-reconfigure --frontend noninteractive tzdata &&\
apt-get install -y vim htop net-tools psmisc wget curl git python3 python3-pip python3-setuptools ca-certificates apt-utils &&\
apt-get install -f &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && rm -rf /root/.cache/pip &&\
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
