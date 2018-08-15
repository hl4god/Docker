# go-alpine

编译基础镜像,镜像里已安装以下go模块

1. golang.org/x/crypto
2. echo
3. beego
4. gin
5. iris
6. jwt-go
7. go-sql-driver/mysql


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