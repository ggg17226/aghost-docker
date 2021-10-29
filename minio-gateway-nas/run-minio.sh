#!/bin/bash
mkdir -p ~/.mc
cat > ~/.mc/config.json <<- EOF
{
  "version": "10",
  "aliases": {
    "local": {
      "url": "http://127.0.0.1:9000",
      "accessKey": "${MINIO_ROOT_USER}",
      "secretKey": "${MINIO_ROOT_PASSWORD}",
      "api": "s3v4",
      "path": "auto"
    }
  }
}
EOF
nohup bash /app/gateway-nas-autoinit.sh 2>&1 &
minio gateway nas ${MINIO_STORAGE_PATH:-/data/storage} --console-address 0.0.0.0:9001




