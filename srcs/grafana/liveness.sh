#!/bin/sh
if [ $(ps -ef | grep "./grafana-server" | wc -l) -ge 2 ] \
	&& [ $(ps -ef | grep "/telegraf/telegraf" | wc -l) -ge 2 ]; then
	echo "All processes are working"
else
	echo "There is a problem" && exit 1
fi