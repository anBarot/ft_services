FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 80 443

RUN apk add --update nginx openssl --no-cache

COPY ./nginx.conf /etc/nginx/.
COPY ./mysite.com.conf /etc/nginx/conf.d
RUN mkdir /var/www/mysite.com
COPY index.html /var/www/mysite.com/.

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/mysite.pem -keyout /etc/ssl/private/mysite.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

CMD ["nginx", "-g", "daemon off;"]