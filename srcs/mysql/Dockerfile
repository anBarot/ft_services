FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

VOLUME /var/lib/mysql

RUN apk update 
RUN	apk add mysql mysql-client

COPY ./my.cnf /etc/.
COPY ./init_mysql.sh .
COPY ./create_db.sh .
COPY ./wrapper.sh .
COPY ./liveness.sh .

RUN mkdir -m 755 /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/.
COPY ./telegraf-1.6.3-static_linux_amd64.tar.gz .
RUN tar xf telegraf-1.6.3-static_linux_amd64.tar.gz && \
	rm telegraf-1.6.3-static_linux_amd64.tar.gz

ENTRYPOINT [ "./wrapper.sh"]
EXPOSE 3306