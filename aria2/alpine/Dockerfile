FROM alpine:3.7

ARG TZ='Asia/Shanghai'

ENV TZ $TZ

COPY  .  /aria2/

## 端口映射
RUN apk add --no-cache \
       bash \
       aria2 \
       darkhttpd \
       tzdata  \
    && apk add  --no-cache --virtual .deps git \
    && git clone https://github.com/ziahamza/webui-aria2.git webui \
    && mkdir -p /aria2/data \
    && rm -rf /aria2/webui/.git \
    && chmod a+x /aria2/start.sh \
    && cp -r -f /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apk del .deps

## Web ui
VOLUME ["/aria2/data"]

EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["./aria2/start.sh"]


