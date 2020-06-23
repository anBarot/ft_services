FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5000

ENV PHP_FPM_USER="nginx"
ENV PHP_FPM_GROUP="nginx"
ENV PHP_FPM_LISTEN_MODE="0660"
ENV PHP_MEMORY_LIMIT="512M"
ENV PHP_MAX_UPLOAD="50M"
ENV PHP_MAX_FILE_UPLOAD="200"
ENV PHP_MAX_POST="100M"
ENV PHP_DISPLAY_ERRORS="On"
ENV PHP_DISPLAY_STARTUP_ERRORS="On"
ENV PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR"
ENV PHP_CGI_FIX_PATHINFO=0

RUN apk add --update nginx mysql-client lighttpd supervisor
RUN apk add php7-fpm php-mbstring php7-openssl php7-json php7-dom php7-zip php7-mysqli \
			php7-curl php7-session php7-opcache php7-gd php7-zlib  php7-common \
			php7-iconv php7-xml php7-imap php7-cgi fcgi \
			php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

ADD supervisor.conf /etc/supervisor.conf
COPY ./nginx.conf /etc/nginx/.
COPY ./phpmyadmin.tar.gz ./
COPY ./phpmyadmin_init.sh ./
COPY ./config.inc.php ./

RUN mkdir -m 755 /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/.
COPY ./telegraf-1.6.3-static_linux_amd64.tar.gz .
RUN tar xf telegraf-1.6.3-static_linux_amd64.tar.gz && \
	rm telegraf-1.6.3-static_linux_amd64.tar.gz

RUN ./phpmyadmin_init.sh

CMD ["supervisord", "-c", "/etc/supervisor.conf"]