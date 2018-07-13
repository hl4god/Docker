# JAVA

JAVA开发环境，使用MAVEN库，免安装jar

## 快速开始

1. Maven项目运行

[maven](https://hub.docker.com/_/maven/)

配置setting.xml
```bash
# 查看是否存在mavenRepo Volume
docker volume ls
# 不存在则创建maven仓库 Volume
docker volume create mavenRepo
# 启动maven项目
 docker run -it --rm --name my-maven-project -v mavenRepo:/usr/share/maven/ref/repository  -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven hl4god/java mvn clean install

```

2. jar包运行

 [anapsix/alpine-java](https://hub.docker.com/r/anapsix/alpine-java/)

可以用来运行本地java项目
```bash
# 目前Latest JRE8/JDK8 Version: 8u172b11
docker run -it --rm anapsix/alpine-java java -version
```

