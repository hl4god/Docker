#!/bin/sh
if [ $2 -eq 1 ]; then
	mv "$3" /aria2/data
fi

echo [$(date)] $2, $3, $1 "<br>" >> /aria2/data/_log.html