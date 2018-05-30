FROM golang:alpine as builder

LABEL maintainer="Holly<hl4god@gmail.com>"

RUN apk update && \
    apk upgrade && \
    apk add git &&\
    go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/client && go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/server



FROM alpine:3.7

COPY --from=builder /go/bin /bin

EXPOSE 7000-8000/udp

EXPOSE 7000-8000