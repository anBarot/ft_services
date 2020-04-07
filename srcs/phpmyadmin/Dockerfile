FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5000

RUN apk update
RUN apk add php7-fpm 
RUN apk add php-cli php-curl php-gd php-intl php-fpm
RUN apk add wget
RUN apk add nginx
RUN apk add openssl
RUN apk add openrc --no-cache

COPY ./nginx.conf /etc/nginx/.
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

RUN mkdir /var/www/my_site.com

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz
RUN tar xf phpMyAdmin-4.9.4-all-languages.tar.gz
RUN rm phpMyAdmin-4.9.4-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.4-all-languages phpmyadmin
RUN chown -R nginx phpmyadmin
RUN chmod 755 -R phpmyadmin
RUN mv phpmyadmin /var/www/my_site.com/.

ECMD ["nginx", "-g", "daemon off;"]