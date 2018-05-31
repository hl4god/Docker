FROM alpine:3.7

LABEL maintainer="Holly <hl4god@gmail.com>"

# https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy
# https://github.com/chrisdaish/docker-squid/blob/master/configFiles/squid.conf
RUN apk  --no-cache add squid

EXPOSE   3128

CMD /usr/sbin/squid -f /etc/squid/squid.conf -NYCd 1
