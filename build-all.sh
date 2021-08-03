#!/usr/bin/env bash

function clean_docker_cache() {
    echo "clean docker build cache" ;
    docker buildx prune -a -f && docker builder prune -a -f;
    echo;
}

date_str=`date "+%Y%m%d"`
base_dir=`pwd`
multi_arch_str="linux/arm64,linux/amd64"
latest_tag_str="latest"


echo date: $date_str
echo "base dir: -----> $base_dir <----"
echo ;
echo init docker build env
docker buildx inspect --bootstrap
echo ;
clean_docker_cache
echo ;

# ubuntu bionic
echo "===================== build ubuntu bionic"
clean_docker_cache
cd $base_dir/ubuntu-bionic
ubuntu_bionic_tag_str="bionic-$date_str"
docker buildx build --platform $multi_arch_str \
--tag agh0st/ubuntu:$ubuntu_bionic_tag_str \
--tag ccr.ccs.tencentyun.com/bmskjy-base-img/ubuntu:$ubuntu_bionic_tag_str \
--push .
clean_docker_cache

# ubuntu focal
echo "===================== build ubuntu bionic"
clean_docker_cache
cd $base_dir/ubuntu-focal
ubuntu_focal_tag_str="focal-$date_str"
docker buildx build --platform $multi_arch_str \
--tag agh0st/ubuntu:$ubuntu_bionic_tag_str \
--tag agh0st/ubuntu:latest_tag_str \
--tag ccr.ccs.tencentyun.com/bmskjy-base-img/ubuntu:$ubuntu_bionic_tag_str \
--tag ccr.ccs.tencentyun.com/bmskjy-base-img/ubuntu:latest_tag_str \
--push .
clean_docker_cache

echo =============$ubuntu_bionic_tag_str
echo =============$ubuntu_focal_tag_str




