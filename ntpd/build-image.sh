#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/arm64,linux/amd64 --no-cache \
--tag agh0st/ntpd-china:4.2.8p12-`date "+%Y%m%d-%H%M-%Z"` \
--tag agh0st/ntpd-china:latest \
--push .