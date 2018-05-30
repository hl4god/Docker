#!/bin/sh

## 设置 rpc-secret
if [ $RPCSECRET ]; then
		echo "rpc-secret=${RPCSECRET}" >> /aria2/aria2.conf
fi

if [ ! -f /aria2/on-complete.sh ]; then
	echo "on-download-complete=/conf/on-complete.sh" >> /aria2/aria2.conf
	chmod +x /aria2/on-complete.sh
fi


darkhttpd /aria2/webui --port 80 &
darkhttpd /aria2/data --port 8080 &
aria2c --conf-path=/aria2/aria2.conf