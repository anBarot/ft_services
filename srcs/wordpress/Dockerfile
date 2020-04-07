FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5050

RUN apk update
RUN apk add nginx openssl wget
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp\
			php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli \
			php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
			php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc \
			php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

COPY ./nginx.conf /etc/nginx/.
COPY ./php-fpm.conf /etc/php7/.
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xf latest.tar.gz
RUN rm latest.tar.gz
RUN chown -R nginx wordpress
RUN chmod 755 -R wordpress
COPY wp-config.php wordpress/.
RUN mv wordpress /var/www/.

ENTRYPOINT ["nginx", "-g", "daemon off;"]