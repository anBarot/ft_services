FROM alpine:3.9
LABEL maintainer="abarot@42.student.fr"

EXPOSE 3306

RUN apk update
RUN apk add mysql mysql-client openrc --no-cache
COPY ./mysql_init.sh /. 
RUN ./mysql_init.sh 

CMD bin/sh