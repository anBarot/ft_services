FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5000

RUN apk update
RUN apk add nginx openssl wget
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd \
		php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
		php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
		php7-gettext php7-ldap php7-ctype php7-dom

COPY ./nginx.conf /etc/nginx/.
COPY ./phpmyadmin_init.sh /.

CMD bin/sh phpmyadmin_init.sh && bin/sh