FROM agh0st/python3:3.8.10-pip20.0.2-20210803
RUN \
env DEBIAN_FRONTEND=noninteractive apt-get update &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -y uwsgi-plugin-python3 &&\
env DEBIAN_FRONTEND=noninteractive apt-get install -f &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y &&\
env DEBIAN_FRONTEND=noninteractive apt-get autoclean &&\
rm -rf /var/lib/apt/lists/* &&\
rm -rf /var/log/*
WORKDIR /app
CMD /bin/bash -c "ulimit -n 65535;chown -R www-data /app; \
/usr/bin/uwsgi --uid 33 --plugin python3 --enable-threads -s 0.0.0.0:${SERVICE_LISTEN_PORT:-5000} \
--manage-script-name --mount /=${INIT_FILE_NAME:-app}:${INIT_FUNC_NAME:-app} -p ${UWSGI_WORKER_NUM:-1} --thunder-lock \
--chown-socket www-data -M -L --refork --tcp-nodelay --so-keepalive --protocol=http "

