FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD mysql_rpsw
ENV MYSQL_USER mysql_user_1
ENV MYSQL_PASSWORD wp_psw

RUN apk update
RUN apk add mysql mysql-client openrc --no-cache
COPY wp_mysql.cnf /etc/mysql/.
RUN mysql_install_db --user=root --datadir=/var/lib/mysql 
# RUN mysql -uroot --skip-password --socket=/var/run/mysqld/mysqld.sock -e "grant all privileges on *.* to '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';"
# RUN mysql -uroot --skip-password --socket=/var/run/mysqld/mysqld.sock -e "flush privileges;"

ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 1; done"]