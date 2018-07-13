# Node
Node开发环境 包含Python 以及C++ 编译环境 方便需要node-gyp编译的node_modules 安装

## 快速开始

使用Node作为开发环境

实例：
` /ws/node/docker-node-demo` 是node项目目录,里面仅有`app.js`一个文件


```bash
# 创建node version 9.x的共享node_modules
docker volume create node_modules9
# 启动 node应用
docker run --rm -ti -v /ws/node/docker-node-demo:/app -v node_modules9:/app/node_modules -w /app -p 3000:3000 --name nodeApp hl4god/node node /app/app.js
```


## 参考

[利用Docker容器搭建高效的Node.js开发环境](http://ju.outofmemory.cn/entry/326707)



