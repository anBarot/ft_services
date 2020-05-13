FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 5050

RUN apk update
RUN apk add nginx openssl wget
RUN apk add php7-fpm php7-openssl php7-json php7-dom php7-zip php7-mysqli \
			php7-curl

COPY ./nginx.conf /etc/nginx/.
COPY ./wp_init.sh ./

CMD bin/sh wp_init.sh && bin/sh