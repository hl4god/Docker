#!/bin/sh


#先判断tcp ports 是否与udp ports数量相等
#检查数据完整性
#且对内容器端口范围必须在7000到8000以内

SCRIPTS = ""

for i in ${KCP2TCP}
do
	TCP_PORT = ${i}|cut -d ":" -f$1
	KCP_PORT = ${i}|cut -d ":" -f$2
	SCRIPTS = $SCRIPTS"server -t ':${TCP_PORT}' -l ':${KCP_PORT}' -mode fast2"
done


eval $SCRIPTS
