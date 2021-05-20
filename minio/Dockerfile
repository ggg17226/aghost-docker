FROM agh0st/ubuntu:focal-20210519
WORKDIR /minio
COPY ./amd64 /minio/minio-amd64
COPY ./arm64 /minio/minio-arm64
CMD /bin/bash -c "${PRE_EXEC_CMD}; if [ `arch` == x86_64 ]; then \
./minio-amd64 server ${EXT_MINIO_ARGS} ; \
elif [ `arch` == aarch64 ]; then \
./minio-arm64 server ${EXT_MINIO_ARGS} ; \
fi "

