FROM golang:1.10-alpine

LABEL maintainer="Holly<1126513660@qq.com>"

RUN apk add --no-cache git &&\
    cd /go/src &&\
    git clone https://github.com/golang/crypto.git golang.org/x/crypto &&\
    go get -u github.com/labstack/echo  &&\
    go get -u github.com/astaxie/beego &&\
    go get -u github.com/gin-gonic/gin &&\
    go get -u github.com/kataras/iris &&\
    go get -u github.com/dgrijalva/jwt-go &&\
    go get -u github.com/go-sql-driver/mysql &&\
    go get -u github.com/jinzhu/gorm &&\
    rm -rf /var/cache/apk
