FROM alpine:3.7

## 添加代理里其他所有软件，都整合在一起
LABEL maintainer="Holly <hl4god@gmail.com>"

ARG TZ='Asia/Shanghai'

ENV TZ $TZ
ENV SS_LIBEV_VERSION 3.1.3
ENV KCP_VERSION 20180316
ENV SS_DOWNLOAD_URL https://github.com/shadowsocks/shadowsocks-libev/releases/download/v${SS_LIBEV_VERSION}/shadowsocks-libev-${SS_LIBEV_VERSION}.tar.gz
ENV OBFS_DOWNLOAD_URL https://github.com/shadowsocks/simple-obfs.git
ENV KCP_DOWNLOAD_URL https://github.com/xtaci/kcptun/releases/download/v${KCP_VERSION}/kcptun-linux-amd64-${KCP_VERSION}.tar.gz


RUN apk add bash  \
    # squid
      squid acf-squid \
    # shadowsocks
    apk add --virtual .build-deps \
        git 