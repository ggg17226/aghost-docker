FROM agh0st/ubuntu:focal-20220201-1331-CST
RUN env DEBIAN_FRONTEND=noninteractive apt-get update &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -y ntp &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* 
COPY ntp.conf /etc/ntp.conf
CMD /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u 114:120 -nN