FROM ubuntu:jammy-20221130
LABEL Author="agh0st <ggg17226@gmail.com>" 
RUN \
  bash -c "if [ `arch` == x86_64 ]; then \
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse\" > /etc/apt/sources.list ;\
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse\" >> /etc/apt/sources.list ;\
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse\" >> /etc/apt/sources.list ;\
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse\" >> /etc/apt/sources.list ;\
  elif [ `arch` == aarch64 ]; then \
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy main restricted universe multiverse\" > /etc/apt/sources.list ;\
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-updates main restricted universe multiverse\" >> /etc/apt/sources.list ;\
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-backports main restricted universe multiverse\" >> /etc/apt/sources.list ;\
  echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ jammy-security main restricted universe multiverse\" >> /etc/apt/sources.list ;\
  fi ";\
  env DEBIAN_FRONTEND=noninteractive apt update &&\
  env DEBIAN_FRONTEND=noninteractive apt install -y tzdata &&\
  ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
  dpkg-reconfigure --frontend noninteractive tzdata &&\
  echo "LANG=en_US.UTF-8" > /etc/default/locale &&\
  env DEBIAN_FRONTEND=noninteractive apt upgrade -y &&\
  env DEBIAN_FRONTEND=noninteractive apt install -y vim htop net-tools psmisc wget curl git ca-certificates apt-utils libhugetlbfs-dev language-pack-zh-hans locales iproute2 nmon net-tools &&\
  env DEBIAN_FRONTEND=noninteractive apt install -f &&\
  sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
  locale-gen &&\
  update-locale &&\
  env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
  env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /var/log/*
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
