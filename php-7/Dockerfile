FROM agh0st/ubuntu:focal-20220907-1623-CST
RUN env DEBIAN_FRONTEND=noninteractive apt-get update &&\
    env DEBIAN_FRONTEND=noninteractive apt-get upgrade -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -y php7.4-fpm php7.4-bcmath php7.4-bz2 php7.4-cli \
      php7.4-curl php7.4-dev php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline \
      php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php-imagick php-redis nginx-full &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /var/log/* &&\
    echo "user  www-data;" > /etc/nginx/nginx.conf &&\
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
    echo "server {" >> /etc/nginx/nginx.conf &&\
    echo "listen       80;" >> /etc/nginx/nginx.conf &&\
    echo "server_name  localhost;" >> /etc/nginx/nginx.conf &&\
    echo "root   /usr/share/nginx/html;" >> /etc/nginx/nginx.conf &&\
    echo "index  index.html index.htm index.php;" >> /etc/nginx/nginx.conf &&\
    echo "location / {" >> /etc/nginx/nginx.conf &&\
    echo 'if ( -f $request_filename) {' >> /etc/nginx/nginx.conf &&\
    echo "break;" >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo 'if ( !-e $request_filename) {' >> /etc/nginx/nginx.conf &&\
    echo 'rewrite ^(.*)$ /index.php/$1 last;' >> /etc/nginx/nginx.conf &&\
    echo "break;" >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo "location  ~ \.php/?.*$  {" >> /etc/nginx/nginx.conf &&\
    echo "fastcgi_pass   unix:/run/php/php7.4-fpm.sock;" >> /etc/nginx/nginx.conf &&\
    echo "fastcgi_index  index.php;" >> /etc/nginx/nginx.conf &&\
    echo "include    fastcgi_params;" >> /etc/nginx/nginx.conf &&\
    echo 'set $fastcgi_script_name2 $fastcgi_script_name;' >> /etc/nginx/nginx.conf &&\
    echo 'if ($fastcgi_script_name ~ "^(.+\.php)(/.+)$") {' >> /etc/nginx/nginx.conf &&\
    echo 'set $fastcgi_script_name2 $1;' >> /etc/nginx/nginx.conf &&\
    echo 'set $path_info        $2;' >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo 'fastcgi_param PATH_INFO     $path_info;' >> /etc/nginx/nginx.conf &&\
    echo 'fastcgi_param SCRIPT_FILENAME   $document_root$fastcgi_script_name2;' >> /etc/nginx/nginx.conf &&\
    echo 'fastcgi_param SCRIPT_NAME       $fastcgi_script_name2;' >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo "error_page   500 502 503 504  /50x.html;" >> /etc/nginx/nginx.conf &&\
    echo "location = /50x.html {" >> /etc/nginx/nginx.conf &&\
    echo "root   /usr/share/nginx/html;" >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    echo "}" >> /etc/nginx/nginx.conf &&\
    sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 1024M/' /etc/php/7.4/fpm/php.ini &&\
    echo "<?php " > /usr/share/nginx/html/index.php &&\
    echo "phpinfo(); " >> /usr/share/nginx/html/index.php
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
CMD mkdir -p /var/log/nginx/ && chown -R www-data /var/log/nginx/ && \
    /usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/7.4/fpm/pool.d/www.conf 74 &&\
    /usr/sbin/php-fpm7.4 -D --fpm-config /etc/php/7.4/fpm/php-fpm.conf &&\
    sed -i "s/__WORKER_PROCESSES__/${NGINX_WORKER_PROCESSES:-1}/" /etc/nginx/nginx.conf &&\
    sed -i "s/__WORKER_CONNECTIONS__/${NGINX_WORKER_CONNECTIONS:-1024}/" /etc/nginx/nginx.conf &&\
    nginx -g "daemon off;"


