# Aria2-With-Webui

结合Aria2 以及 WebUI 。

## Quick Start

```bash
sudo docker run -d \
--name aria2 \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /www/data:/aria2/data \
-e SECRET=456123 \
hl4god/aria2-with-webui


