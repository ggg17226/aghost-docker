FROM agh0st/ubuntu:focal-20211029-1818-CST
WORKDIR /app
COPY run-minio.sh /app/
COPY gateway-nas-autoinit.sh /app/
RUN /bin/bash -c "\
    cd /app;\
    if [ `arch` == x86_64 ]; then \
    wget http://192.168.27.101/minio/linux-amd64/minio; \
    wget http://192.168.27.101/minio/linux-amd64/mc; \
    elif [ `arch` == aarch64 ]; then \
    wget http://192.168.27.101/minio/linux-arm64/minio; \
    wget http://192.168.27.101/minio/linux-arm64/mc; \
    fi;\
    chmod a+x *; \
    ln -s /app/* /usr/local/bin/; \
    mc --autocompletion;"

CMD /app/run-minio.sh



