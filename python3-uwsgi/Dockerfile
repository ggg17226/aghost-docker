FROM agh0st/python3:3.8.10-pip20.0.2-20210803
RUN \
env DEBIAN_FRONTEND=noninteractive apt-get update &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y uwsgi-plugin-python3 nginx-full &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*
WORKDIR /app
CMD /bin/bash -c "chown -R www-data /app;mkdir -p /var/log/nginx/;touch /var/log/nginx/error.log;echo \"\
user www-data;pid /run/nginx.pid;include /etc/nginx/modules-enabled/*.conf;events {worker_connections 2048;}\
http {sendfile on;tcp_nopush on;tcp_nodelay on;keepalive_timeout 65;types_hash_max_size 2048;\
include /etc/nginx/mime.types;default_type application/octet-stream;access_log off;error_log off;\
gzip off;upstream uwsgi_app {server unix:/tmp/uwsgi-app.sock fail_timeout=0;}\
server{listen 80 default_server;server_name _;client_max_body_size 100M;location / {\
proxy_read_timeout 300;proxy_connect_timeout 300;proxy_redirect off;proxy_http_version 1.1;\
proxy_set_header Host \\\$host;proxy_set_header X-Real-IP \\\$remote_addr;proxy_set_header X-Forwarded-For \\\$proxy_add_x_forwarded_for;\
proxy_set_header X-Forwarded-Host \\\$host;proxy_pass http://uwsgi_app;\
}}}\
\" > /etc/nginx/nginx.conf && /usr/sbin/nginx -t || exit 16;\
ulimit -n 65535;/usr/sbin/nginx; \
/usr/bin/uwsgi --uid 33 --plugin python3 --enable-threads -s /tmp/uwsgi-app.sock \
--manage-script-name --mount /=${INIT_FILE_NAME:-app}:${INIT_FUNC_NAME:-app} -p ${UWSGI_WORKER_NUM:-1} --thunder-lock \
--chown-socket www-data -M -L --refork --tcp-nodelay --so-keepalive "

