FROM agh0st/ubuntu:focal-20210729
WORKDIR /app
RUN \
    echo "if ! (" >> /root/.profile &&\
    echo "perl -MCPAN -e 'CPAN::HandleConfig->load();' \\" >> /root/.profile &&\
    echo "-e 'CPAN::HandleConfig->prettyprint("urllist")' |" >> /root/.profile &&\
    echo "grep -qF 'http://mirrors.tuna.tsinghua.edu.cn/CPAN/'" >> /root/.profile &&\
    echo "); then" >> /root/.profile &&\
    echo "perl -MCPAN -e 'CPAN::HandleConfig->load();' \\" >> /root/.profile &&\
    echo "-e 'CPAN::HandleConfig->edit(\"urllist\", \"unshift\", \"http://mirrors.tuna.tsinghua.edu.cn/CPAN/\");' \\" >> /root/.profile &&\
    echo "-e 'CPAN::HandleConfig->commit()'" >> /root/.profile &&\
    echo "fi" >> /root/.profile &&\
    env DEBIAN_FRONTEND=noninteractive apt-get update &&\
    env DEBIAN_FRONTEND=noninteractive apt-get upgrade -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -y gcc g++ make cmake build-essential libtool-bin \
    libjemalloc-dev luajit libluajit-5.1-dev liblua5.1-0-dev libpcre3-dev libcrypt-dev libssl-dev openssl \
    zlib1g-dev libxslt1-dev libgd-dev libgeoip-dev  &&\
    env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
    env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
    cd /app &&\
    curl -L -o tengine.tar.gz https://tengine.taobao.org/download/tengine-2.3.3.tar.gz &&\
    tar xf tengine.tar.gz &&\
    curl -L -o ngx-cache-purge.tar.gz https://file.aghost.cn/source/ngx-cache-purge-2.3.tar.gz &&\
    tar xf ngx-cache-purge.tar.gz &&\
    mv ngx_cache_purge-2.3 ngx-cache-purge &&\
    curl -L -o ndk.tar.gz https://file.aghost.cn/source/ndk-0.3.1.tar.gz &&\
    tar xf ndk.tar.gz &&\
    mv ngx_devel_kit-0.3.1 ndk &&\
    curl -L -o echo.tar.gz https://file.aghost.cn/source/ngx-echo-0.62.tar.gz &&\
    tar xf echo.tar.gz &&\
    mv echo-nginx-module-0.62 echo &&\
    rm -rf /app/tengine.tar.gz /app/ngx-cache-purge.tar.gz /app/ndk.tar.gz /app/echo.tar.gz &&\
    cd tengine-2.3.3 &&\
    ./configure \
    --prefix=/usr/share/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --lock-path=/var/lock/nginx.lock \
    --pid-path=/run/nginx.pid \
    --modules-path=/usr/lib/nginx/modules \
    --http-client-body-temp-path=/var/lib/nginx/body \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --with-compat \
    --with-pcre \
    --with-pcre-jit \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-http_auth_request_module \
    --with-http_v2_module \
    --with-http_dav_module \
    --with-http_slice_module \
    --with-threads \
    --with-http_addition_module \
    --with-http_flv_module \
    --with-http_geoip_module \
    --with-stream_geoip_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_image_filter_module \
    --with-http_mp4_module \
    --with-http_perl_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_sub_module \
    --with-http_xslt_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-stream_realip_module \
    --with-stream_geoip_module \
    --with-stream_sni \
    --with-jemalloc \
    --with-http_lua_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_auth_request_module \
    --add-dynamic-module=/app/ngx-cache-purge \
    --add-dynamic-module=/app/ndk \
    --add-dynamic-module=/app/echo \
    --with-luajit-inc=/usr/include/luajit-2.1 \
    --with-perl=/usr/share/perl6/ &&\
    ldconfig  \
#    &&\
#    make -j `cat /proc/cpuinfo|grep "model name"|wc -l`




CMD /bin/bash
