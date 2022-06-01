FROM agh0st/ubuntu:jammy-20220601-1806-CST
LABEL Author="agh0st <ggg17226@gmail.com>"

RUN \
  bash -c "cd /tmp;\
    if [ `arch` == x86_64 ]; then \
      wget https://file.aghost.cn/software/kcptun/amd64/kcptun-client;\
      wget https://file.aghost.cn/software/kcptun/amd64/kcptun-server;\
    elif [ `arch` == aarch64 ]; then \
      wget https://file.aghost.cn/software/kcptun/arm64/kcptun-client;\
      wget https://file.aghost.cn/software/kcptun/arm64/kcptun-server;\
    fi ";\
    chmod a+x /tmp/kcptun-client /tmp/kcptun-server;\
    mv /tmp/kcptun-* /usr/local/bin

