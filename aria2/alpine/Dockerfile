FROM alpine:latest
##  下载到指定目录（静态服务器资源目录） https://wiki.alpinelinux.org/wiki/Lighttpd
## https://wiki.alpinelinux.org/wiki/Darkhttpd
## darkhttpd 是一个安全的、轻量级、快速和单线程的 HTTP/1.1 的Web服务器，只支持静态文件。只需一个可执行文件。


## https://github.com/ziahamza/webui-aria2
## 加上webui-aria2 管理
## 简单静态下载网站 在线播放网站
## https://codeload.github.com/ziahamza/webui-aria2/zip/master

## 端口映射
RUN apk add --no-cache \
       aria2 \
       Darkhttpd \
    && apk add --virtual .deps \
       unzip \
    && curl -O https://codeload.github.com/ziahamza/webui-aria2/zip/master \
    && unzip webui-aria2-master.zip \
    && mkdir /www \
    && mv webui-aria2-master /www/webui-aria2 \
    && rm webui-aria2-master.zip \
    && aria2c --conf-path=aria2.conf -D \
    && rc-update add darkhttpd \
    && darkhttpd /www/webui-aria2 \
    && apk del .deps

VOLUME /www
## Web ui
EXPOSE 80

CMD ["--conf-path=aria2.conf" ,"-D"]
ENTRYPOINT [ "/usr/bin/aria2c" ]


