FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 3306
VOLUME /var/lib/mysql

ENV MYSQL_ROOT_PASSWORD=mariadb_psw
ENV WP_USER=wp_user
ENV WORDPRESS_DB_HOST=localhost
ENV WORDPRESS_DB_PASSWORD=psw

RUN apk update 
RUN	apk add mysql mysql-client 

COPY ./my.cnf /etc/.
COPY ./mysql_init.sh .

ENTRYPOINT ["/bin/sh","./mysql_init.sh"]