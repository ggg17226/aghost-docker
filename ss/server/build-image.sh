#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/amd64 --no-cache \
  --tag agh0st/ss:latest \
  --tag agh0st/ss:$(date "+%Y%m%d-%H%M-%Z") \
  --push .
