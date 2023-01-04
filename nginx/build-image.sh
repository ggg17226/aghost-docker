#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/arm64,linux/amd64 --no-cache \
--tag agh0st/nginx:latest \
--tag agh0st/nginx:1.18.0-`date "+%Y%m%d-%H%M-%Z"` \
--push .