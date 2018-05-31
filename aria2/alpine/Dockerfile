FROM alpine:3.7

ARG TZ='Asia/Shanghai'
ENV TZ $TZ

COPY  .  /aria2

WORKDIR /aria2

## 端口映射
RUN apk update \
 && apk add --no-cache \
       bash \
       aria2 \
       darkhttpd \
       tzdata  \
    && apk add  --no-cache --virtual .deps git \
    && cd /aria2 \
    && git clone https://github.com/ziahamza/webui-aria2.git webui \
    && mkdir data \
    && rm -rf webui/.git \
    && chmod a+x start.sh \
    && cp -r -f /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apk del .deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

## Web ui
VOLUME ["/aria2/data"]

EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["./start.sh"]


