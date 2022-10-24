#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/arm64,linux/amd64 --no-cache \
--tag agh0st/node:latest \
--tag agh0st/node:16.18.0-buster-`date "+%Y%m%d-%H%M-%Z"` \
--push .