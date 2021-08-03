FROM agh0st/ubuntu:focal-20210729
RUN \
env DEBIAN_FRONTEND=noninteractive apt update &&\
env DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-pip python3-setuptools gcc g++ make cmake build-essential &&\
env DEBIAN_FRONTEND=noninteractive apt install -f &&\
env DEBIAN_FRONTEND=noninteractive apt autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt autoclean &&\
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && rm -rf /root/.cache/pip &&\
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple &&\
python3 --version &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*
