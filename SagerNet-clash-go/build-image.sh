#!/bin/bash
docker buildx inspect --bootstrap
docker buildx prune -a -f && docker builder prune -a -f
docker buildx build --platform linux/amd64 --no-cache \
  --tag agh0st/SagerNet-clash-go:latest \
  --tag agh0st/SagerNet-clash-go:$(date "+%Y%m%d-%H%M-%Z") \
  --push .
