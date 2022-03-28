#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/amd64 --no-cache \
--tag agh0st/python3:3.9.12-`date "+%Y%m%d-%H%M-%Z"` \
--push .