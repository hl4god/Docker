# KCPtun

支持使用kcptun给多个tcp端口加速

## Quick Start

```bash
docker run --name kcptun \
   -p 7000:7000 \
   -p 6100:6100/udp \
   hl4god/kcptun  
```

**多个tcp端口加速**

```bash
docker run --name kcptun \
   -p 7000:7000 \
   -p 6100:6100/udp \
   -e KCP2TCP="6000/udp:7000"
   -e KCP2TCP="6010/udp：7010"
   hl4god/kcptun  
```