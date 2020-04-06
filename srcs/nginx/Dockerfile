FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 80

RUN apk update
RUN apk add nginx
RUN apk add openssl

COPY ./nginx.conf /etc/nginx/.

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 1; done"]