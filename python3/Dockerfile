FROM agh0st/ubuntu:bionic-20201019
RUN apt-get update &&\
apt-get install -y python3 python3-pip python3-setuptools gcc g++ make cmake build-essential &&\
apt-get install -f &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && rm -rf /root/.cache/pip &&\
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple &&\
python3 --version
