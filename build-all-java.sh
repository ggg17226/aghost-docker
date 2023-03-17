#!/bin/bash
local_dir=`pwd`
for i in `ls -laF $local_dir | grep -E 'jdk|jre' | awk '{print $9}'`;
do \
  working_dir=${local_dir}/${i}
  echo ==========================$working_dir;\
  cd $working_dir && \
  bash ./build-image.sh || break\
 done