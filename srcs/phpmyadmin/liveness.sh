#!/bin/sh
if [ $(ps -ef | grep "php-fpm: master process" | wc -l) -ge 2 ] && [ $(ps -ef | grep "master process nginx" | wc -l) -ge 2 ] \
	&& [ $(ps -ef | grep "/telegraf/telegraf" | wc -l) -ge 2 ]; then
	echo "All processes are working"
else
	echo "There is a problem" && exit 1
fi