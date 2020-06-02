FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

RUN apk add vsftpd
RUN apk add lftp
RUN apk add openrc --no-cache
COPY vsftpd.conf /etc/vsftpd/.

CMD rc-service vsftpd start
ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 1; done"]