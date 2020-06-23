FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

EXPOSE 80 443 2222

RUN apk add --update nginx openssl supervisor openssh --no-cache

COPY ./nginx.conf /etc/nginx/.
COPY ./sshd_config /etc/ssh/.
COPY ./init_ssh.sh .
ADD supervisor.conf /etc/supervisor.conf

RUN ./init_ssh.sh

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/mysite.pem -keyout /etc/ssl/private/mysite.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

RUN mkdir -m 755 /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/.
COPY ./telegraf-1.6.3-static_linux_amd64.tar.gz .
RUN tar xf telegraf-1.6.3-static_linux_amd64.tar.gz && \
	rm telegraf-1.6.3-static_linux_amd64.tar.gz

CMD ["supervisord", "-c", "/etc/supervisor.conf"]