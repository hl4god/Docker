# Aria2-With-Webui

结合Aria2 以及 WebUI 。
## Quick Start

```bash
docker run --name aria2 -d hl4god/aria2-with-webui
```

## 参考

https://aria2.github.io/manual/en/html/aria2c.html#rpc-auth

```bash
##  https://github.com/XUJINKAI/aria2-with-webui/blob/master/README.md
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
xujinkai/aria2-with-webui


sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /study/aria2/download:/data \
-v /study//aria2/conf:/conf \
-e SECRET=456123 \
xujinkai/aria2-with-webui

```