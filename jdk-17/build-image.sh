#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/arm64,linux/amd64 --no-cache \
--tag agh0st/jdk:17.0.2p8-`date "+%Y%m%d-%H%M-%Z"` \
--tag agh0st/jdk:latest \
--push .