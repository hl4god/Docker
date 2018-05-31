# Aria2-With-Webui

结合Aria2 以及 WebUI 。

## Quick Start

```bash
sudo docker run -d \
--name aria2 \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /var/www/data:/aria2/data \
-e RPCSECRET=123456 \
hl4god/aria2-with-webui
```


Aria2下载页面
http://[host]:6880

下载目录索引页面
http://[host]:6888

