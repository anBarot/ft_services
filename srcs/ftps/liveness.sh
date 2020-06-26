#!/bin/sh
if [ $(ps -ef | grep "vsftpd /etc/vsftpd.conf" | wc -l) -eq 2 ] \
	&& [ $(ps -ef | grep "/telegraf/telegraf" | wc -l) -eq 2 ]; then
	echo "All processes are working"
else
	echo "There is a problem" && exit 1
fi