FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

RUN apk update && apk add --no-cache vsftpd supervisor openssl

COPY ./vsftpd.conf /etc/vsftpd.conf
COPY ./init_ftps.sh .
COPY ./liveness.sh .
ADD ./supervisor.conf /etc/supervisor.conf

RUN ./init_ftps.sh

RUN mkdir -m 755 /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/.
COPY ./telegraf-1.6.3-static_linux_amd64.tar.gz .
RUN tar xf telegraf-1.6.3-static_linux_amd64.tar.gz && \
	rm telegraf-1.6.3-static_linux_amd64.tar.gz

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
EXPOSE 21 20 30012 30013 30014