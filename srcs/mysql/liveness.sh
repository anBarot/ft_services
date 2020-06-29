#!/bin/sh
if [ $(ps -ef | grep "/usr/bin/mysqld --basedir=/usr" | wc -l) -ge 2 ] \
	&& [ $(ps -ef | grep "/telegraf/telegraf" | wc -l) -ge 2 ]; then
	echo "All processes are working"
else
	echo "There is a problem" && exit 1
fi