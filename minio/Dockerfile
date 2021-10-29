FROM agh0st/ubuntu:focal-20210729
WORKDIR /app
COPY run-minio.sh
RUN /bin/bash -c "\
    cd /app;\
    if [ `arch` == x86_64 ]; then \
        wget http://192.168.27.101/minio/linux-amd64/minio; \
    elif [ `arch` == aarch64 ]; then \
        wget http://192.168.27.101/minio/linux-arm64/minio; \
    fi;\
    chmod a+x minio"

CMD /app/run-minio.sh



