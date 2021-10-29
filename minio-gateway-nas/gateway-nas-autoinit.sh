#!/bin/bash
while true; do mc ls local/ && break; sleep 1;done
mc admin user add local/ ${MINIO_NORMAL_USER:-normal_user} ${MINIO_NORMAL_USER_PASSWORD:-normal_user_password}
mc admin policy set local/ readwrite user=${MINIO_NORMAL_USER:-normal_user}
