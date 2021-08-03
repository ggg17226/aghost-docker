FROM agh0st/python3:3.8.10-pip20.0.2-20210803
RUN \
env DEBIAN_FRONTEND=noninteractive apt-get update &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y uwsgi-plugin-python3 nginx-full &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/* 


