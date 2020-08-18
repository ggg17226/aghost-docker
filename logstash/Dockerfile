from ubuntu:bionic-20200713
MAINTAINER agh0st <ggg17226@gmail.com>
COPY es-gpg-key /tmp/es-gpg-key
RUN echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list &&\
apt-get update &&\
apt-get upgrade -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata gnupg &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
dpkg-reconfigure --frontend noninteractive tzdata &&\
echo "deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/elasticstack/7.x/apt/  stable main " >> /etc/apt/sources.list &&\
apt-key add /tmp/es-gpg-key &&\
apt update &&\
apt-get install -y vim htop net-tools psmisc wget curl git ca-certificates apt-utils dialog openjdk-11-jdk &&\
java -version &&\
apt-get install -y logstash=1:7.8.0-1 &&\
apt-get install -f &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
sed -i 's/-XX:+UseConcMarkSweepGC/-XX:+UnlockExperimentalVMOptions/' /etc/logstash/jvm.options &&\
sed -i 's/-XX:CMSInitiatingOccupancyFraction=75/-XX:+UseZGC/' /etc/logstash/jvm.options &&\
sed -i 's/-XX:+UseCMSInitiatingOccupancyOnly//' /etc/logstash/jvm.options &&\
sed -i 's/"GPGC New"/"GPGC New"\, "ZGC"/' /usr/share/logstash/logstash-core/lib/logstash/instrument/periodic_poller/jvm.rb &&\
sed -i 's/"GPGC Old"/"GPGC Old"\, "ZGC"/' /usr/share/logstash/logstash-core/lib/logstash/instrument/periodic_poller/jvm.rb &&\
sed -i 's/logstash-stderr.log &/logstash-stderr.log/' /etc/init.d/logstash &&\
sed -i 's/>> \/var\/log\/logstash-stdout\.log 2>> \/var\/log\/logstash-stderr\.log//' /etc/init.d/logstash &&\
sed -i 's/rootLogger\.appenderRef\.console\.ref/#rootLogger\.appenderRef\.console\.ref/' /etc/logstash/log4j2.properties &&\
sed -i 's/# Run the program!/mkdir -p \/var\/log\/logstash\/$\{HOSTNAME\}/' /etc/init.d/logstash &&\
sed -i 's/logstash\/gc/logstash\/${HOSTNAME}\/gc/' /etc/default/logstash &&\
sed -i 's/-Xmx1g//' /etc/logstash/jvm.options &&\
sed -i 's/-Xms1g//' /etc/logstash/jvm.options &&\
sed -i '/parse_jvm_options() {/a\echo " -Xmx${MEM_SIZE:-1024}m -Xms${MEM_SIZE:-1024}m "' /usr/share/logstash/bin/logstash.lib.sh
COPY logstash /usr/local/bin/logstash
RUN chmod a+x /usr/local/bin/logstash && chmod a+r /usr/local/bin/logstash 
CMD /usr/local/bin/logstash
