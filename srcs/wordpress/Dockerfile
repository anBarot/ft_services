FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5050

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN apk add php-cli php7-mysqli php-gd php-intl php7-fpm
RUN apk add wget

COPY ./nginx.conf /etc/nginx/.
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

RUN mkdir /var/www/my_site.com
RUN chown -R nginx /var/www/my_site.com
RUN chmod 755 -R /var/www/my_site.com

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xf latest.tar.gz
RUN rm latest.tar.gz
RUN chown -R nginx wordpress
RUN chmod 755 -R wordpress
COPY wp-config.php wordpress/.
RUN mv wordpress /var/www/my_site.com/.

ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 1; done"]