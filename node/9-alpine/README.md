# Node
Node开发环境 包含Python 以及C++ 编译环境 方便需要node-gyp编译的node_modules 安装

## 使用Node作为开发环境

用Docker搭建Node.js开发环境实例
虽然Node.js在前后端开发使用场景作用差别很大，前端通常用来运行构建工具，如gulp、webpack等，后端则可以直接执行js代码启动服务器。 
不过目录结构大体相同，所以可以放在一起讨论。下面是个简单的项目结构示例，代表了项目种的几类文件和目录。 
我们现在有个Node.js项目，在 C:\Repo\project 路径中

```
 - src //源文件目录
 - node_modules // node模块
 - package.json // node模块管理工具
 - dist // 被压缩、合并、编译生成的目标代码目录
```
在这个项目结构中， src 、 package.json 是开发中可能需要修改的目录和文件， node_modules 是需要被缓存的目录， dist 是需要用来部署、执行的目录。

用Docker容器管理项目在此便会出现分歧。

一部分开发者可能会如前面提到的文章一样，通过编写Dockerfile来构建镜像，将node_modules放入镜像中，然后挂载源码路径，这样以后搭建开发环境可以直接通过镜像创建容器来实现，不过实现的问题是：

每次配置文件改动、模块依赖变化都需要重新build，即使不build直接在容器中用npm安装，但是由于package.json是文件，无法挂载，所以导致又需要手动同步配置文件，这些都是相当麻烦而且容易出错的。

另一部分开发者可能会想到直接挂载整个项目，如
```
docker run -itd -v C:\Repo\project:/project --name project node:7-alpine
```
但是这样并不能缓存node_modules目录，只是在容器中执行node进程而已。

那把node_modules再单独挂载一次不就行了？很遗憾，Docker并不支持这种嵌套挂载宿主机目录的方式~

但这个思路已经很接近我们想要的结果了，所以我们要用另外的方式挂载node_modules来进行缓存，比如说把它和另一个容器进行挂载。

先创建一个容器用来缓存node_modules，并暴露 /project/node_modules 作为挂载路径
```
docker run -it -v /project/node_modules --name node_modules alpine
```
然后创建容器时通过 –volumes-from 实现与缓存容器共享 /project/node_modules。
```
docker run -itd -v C:\Repo\project:/project --volumes-from node_modules --name project node:7-alpine
```
再project容器中安装一个lodash 模块试试是否成功。
```
docker exec -it project npm i lodash
```
创建一个临时容器看看是否安装成功。
```
docker exec -it --rm --volumes-from node_modules -w /project node:7-alpine ls node_modules
```
成功显示lodash，打开宿主机上的文件夹，node_modules下空空如也，证明模块已安装到容器中，且可以重复使用。

开发环境优化
把数据保存在容器中并不是一种值得推荐的做法，抛开Docker守护进程和容器本身的稳定性不说，容器也存在一定被误删的可能性。 
而这种共享卷的方式有个更麻烦的问题是所有想利用这个缓存卷的容器目录结构都必须是 /project/node_modules，这样的限制就显得很不友好了。 
另外用来缓存卷的容器基本上算是浪费了，起不到什么实质性的作用。

顺着挂载卷这条线索继续往下找，便可以发现更好的解决方法：创建一个Docker volume用来共享容器间的数据。
```
docker volume create node_modules7
```
首先的好处便是这个volume可以叫任意名字，也可以挂载到容器不同的路径下。这里之所以加上“7”是因为不同npm版本组织模块的方式会有些不同，这里通过对node版本号来进行标注，表示这些模块可用于Node.js 7版本。

这时候创建容器我们便可以用node_modules7这个volume进行挂载了
```
docker run -itd -v C:\Repo\project:/project -v node_modules7:/project/node_modules --name project node:7-alpine
```
这次我们安装underscore测试一下
```
docker exec -it project npm i underscore
```
依旧创建一个临时容器看看是否安装成功，不过我们挂载到容器的/app/node_modules目录下试试
```
docker exec -it --rm -v node_modules7:/app/node_modules -w /project node:7-alpine ls node_modules
```
显示underscore目录，表示模块共享成功。


## 参考

[利用Docker容器搭建高效的Node.js开发环境](http://ju.outofmemory.cn/entry/326707)



