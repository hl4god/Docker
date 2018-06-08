# Alpine-Git

支持Git,SSH

## Quick Start


```
docker run --name alpine-git -v /path/to/workdir:/data  -dit hl4god/alpine-git
```

**进入容器**

```bash
docker exec -ti alpine-git ssh-keygen sh
```

**进入容器后生成ssh公钥**

```bash
ssh-keygen -t rsa -C "xxxxx@xxxxx.com"

# Generating public/private rsa key pair...
# 三次回车即可生成 ssh key
```

**查看你的 public key**

```bash
cat ~/.ssh/id_rsa.pub
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6eNtGpNGwstc....
```
把打印出的public key 添加到Github或其他Git服务平台

**测试git是否成功**

```bash
ssh -T git@gitee.com
```

**设置Git用户配置**

```bash
git config --global user.name [username]
git config --global user.email [email]
```


## 作用

1. 可以作为ssh客户端，连接远程服务器
2. 可以作为Git客户端，同步项目代码到Git服务器
3. 可迁移使用到另一台主机使用