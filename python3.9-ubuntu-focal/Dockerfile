FROM agh0st/ubuntu:focal-20220319-0943-CST
RUN \
  env DEBIAN_FRONTEND=noninteractive apt update &&\
  env DEBIAN_FRONTEND=noninteractive apt install -y gcc g++ cmake build-essential make libssl-dev \
                                                    libbz2-dev zlib1g-dev liblzma-dev libdb-dev libgdbm-dev \
                                                    libsqlite3-dev uuid-dev libreadline-dev libevent-dev libffi-dev \
                                                    libncurses5-dev tk8.6-dev &&\
  env DEBIAN_FRONTEND=noninteractive apt install -f &&\
  env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
  env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
  cd /tmp && wget http://192.168.27.101/Python-3.9.12-build.tar.gz && tar xf Python-3.9.12-build.tar.gz &&\
  cd /tmp/Python-3.9.12 && make install && rm -rf /tmp/* &&\
  pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple &&\
  python3 --version &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /var/log/*