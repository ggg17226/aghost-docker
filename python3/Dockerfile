FROM agh0st/ubuntu:bionic-20200927
RUN apt-get install -y ython3 python3-pip python3-setuptools &&\
apt-get install -f &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && rm -rf /root/.cache/pip &&\
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple &&\
python3 --version
