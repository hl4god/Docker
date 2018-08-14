# go-alpine

编译基础镜像

## 快速开始

```dockerfile
FROM hl4god/go-base

LABEL maintainer="Holly<1126513660@qq.com>"

COPY . /go/src/goapp/

RUN  cd /go/src/goapp &&\
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /go/src/goapp/main /
CMD ["/main"]
EXPOSE 2323

```