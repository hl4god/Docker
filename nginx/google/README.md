# Nginx-Google

Nginx 反代google

从镜像里拷贝一份nginx配置
```bash
docker run --name temp  --rm hl4god/nginx-google tar -cC /etc/nginx . | tar -xC /etc/nginx-google
```

修改本地目录下的nginx配置

```bash
docker run --name nginx-google \
-p 80:80 \
-p 443:443 \
-v /etc/nginx-google:/etc/nginx/ \
-d hl4god/nginx-google
```


```
docker run --name nginx-google \
-p 80:80 \
-p 443:443 \
-v /etc/letsencrypt:/etc/letsencrypt \
-v /var/www:/var/www \
-v /etc/nginx-google:/etc/nginx/ \
-d hl4god/nginx-google
```

```bash
## 生成证书
 certbot  certonly --webroot -w /var/www -d  g.javajs.cc -d g.javajs.tk
```

```
# https://cachecheck.opendns.com/
upstream www.google.com {
    # Hong Kong, China
    server 216.58.221.110:443;
    server 216.58.221.132:443;
    #Tokyo, Tokyo-to, Japan
    server 172.217.31.142:443;
    # Singapore, Singapore
    server 74.125.68.99:443;
    server 74.125.68.100:443;
    server 74.125.68.101:443;
    server 74.125.68.102:443;
    server 74.125.68.103:443;
    server 74.125.68.104:443;
    server 74.125.68.105:443;
    server 74.125.68.106:443;
    server 74.125.68.113:443;
    server 74.125.68.138:443;
    server 74.125.68.139:443;
    server 74.125.68.147:443;
    # Mumbai, Maharashtra, India
    server 172.217.166.174:443;
    server 172.217.166.164:443;
}
```
## 参考

[nginx Dockerfile](https://github.com/nginxinc/docker-nginx/blob/d377983a14b214fcae4b8e34357761282aca788f/stable/alpine/Dockerfile)

[Nginx Module for Google](https://github.com/cuber/ngx_http_google_filter_module)