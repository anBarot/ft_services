FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

VOLUME /var/lib/mysql

RUN apk update 
RUN	apk add mysql mysql-client

COPY ./my.cnf /etc/.
COPY ./init_mysql.sh .
COPY ./create_db.sh .
COPY ./wrapper.sh .

ENTRYPOINT [ "./wrapper.sh"]
EXPOSE 3306