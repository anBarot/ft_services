#!/bin/sh
if [ $(ps -ef | grep "/usr/sbin/sshd" | wc -l) -eq 2 ] && [ $(ps -ef | grep "master process nginx" | wc -l) -eq 2 ] \
	&& [ $(ps -ef | grep "/telegraf/telegraf" | wc -l) -eq 2 ]; then
	echo "All processes are working"
else
	echo "There is a problem" && exit 1
fi