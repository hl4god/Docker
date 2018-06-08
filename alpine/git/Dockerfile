FROM alpine:3.7

LABEL maintainer="Holly <hl4god@gmail.com>"

RUN apk update && \
    apk add --no-cache openssh-client git && \
    mkdir /data && \
    rm -rf /var/cache/apk

VOLUME ["/data"]