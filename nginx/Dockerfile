FROM nginx:1.20.2-perl
MAINTAINER agh0st <ggg17226@gmail.com>
RUN \
bash -c "echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free\" \
> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free\" \
>> /etc/apt/sources.list ;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free\" \
>> /etc/apt/sources.list;\
echo \"deb [trusted=yes] http://mirrors.tuna.tsinghua.edu.cn/debian-security/ buster/updates main contrib non-free\" \
>> /etc/apt/sources.list ;";\
bash -c "\
env DEBIAN_FRONTEND=noninteractive apt update && env DEBIAN_FRONTEND=noninteractive apt upgrade -y &&\
 env DEBIAN_FRONTEND=noninteractive apt install -y tzdata &&\
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata &&\
echo \"LANG=en_US.UTF-8\" > /etc/default/locale  &&\
env DEBIAN_FRONTEND=noninteractive apt install -y vim net-tools psmisc wget curl ca-certificates \
xfonts-intl-chinese xfonts-intl-chinese-big  &&\
env DEBIAN_FRONTEND=noninteractive apt install -f &&\
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
locale-gen &&\
update-locale &&\
apt-get autoremove -y &&\
apt-get autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*" && \
echo "user  nginx;" > /etc/nginx/nginx.conf &&\
echo "worker_processes __WORKER_PROCESSES__;" >> /etc/nginx/nginx.conf &&\
echo "error_log off;" >> /etc/nginx/nginx.conf &&\
echo "pid /var/run/nginx.pid;" >> /etc/nginx/nginx.conf &&\
echo "events {worker_connections  __WORKER_CONNECTIONS__;}" >> /etc/nginx/nginx.conf &&\
echo "http {" >> /etc/nginx/nginx.conf &&\
echo "include /etc/nginx/mime.types;" >> /etc/nginx/nginx.conf &&\
echo "default_type application/octet-stream;" >> /etc/nginx/nginx.conf &&\
echo "access_log off;" >> /etc/nginx/nginx.conf &&\
echo "server_tokens off;" >> /etc/nginx/nginx.conf &&\
echo "sendfile on;" >> /etc/nginx/nginx.conf &&\
echo "keepalive_timeout  65;" >> /etc/nginx/nginx.conf &&\
echo "include /etc/nginx/conf.d/*.conf;" >> /etc/nginx/nginx.conf &&\
echo "}" >> /etc/nginx/nginx.conf
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
CMD mkdir -p /var/log/nginx/ && chown -R nginx /var/log/nginx/ && \
sed -i "s/__WORKER_PROCESSES__/${NGINX_WORKER_PROCESSES:-1}/" /etc/nginx/nginx.conf &&\
sed -i "s/__WORKER_CONNECTIONS__/${NGINX_WORKER_CONNECTIONS:-1024}/" /etc/nginx/nginx.conf &&\
nginx -g "daemon off;"
