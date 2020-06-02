FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5050
VOLUME /var/www/html

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

RUN apk update
RUN apk add nginx openssl mysql-client supervisor
RUN apk add php7-fpm php7-openssl php7-json php7-dom php7-zip php7-mysqli \
			php7-curl

ADD supervisor.conf /etc/supervisor.conf
COPY ./nginx.conf /etc/nginx/.
COPY ./latest.tar.gz ./
COPY ./wp-config.php ./
COPY ./wp_init.sh ./

RUN ./wp_init.sh

CMD ["supervisord", "-c", "/etc/supervisor.conf"]