FROM alpine:3.7

ARG TZ='Asia/Shanghai'

ENV TZ $TZ

COPY  .  /aria2

WORKDIR  /aria2

## 端口映射
RUN apk add --no-cache \
       bash \
       aria2 \
       darkhttpd \
       tzdata  \
       curl \
    && curl -O https://codeload.github.com/ziahamza/webui-aria2/zip/master \
    && unzip webui-aria2-master.zip \
    && mv webui-aria2-master webui \
    && mkdir data \
    && rm webui-aria2-master.zip \
    && chmod a+x start.sh \
    && cp -r -f /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apk del .deps

## Web ui
VOLUME ["/aria2/data"]

EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/aria2/start.sh"]


