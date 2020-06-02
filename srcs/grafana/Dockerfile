FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

RUN apk update 
RUN apk add software-properties-common wget
RUN apt-get install -y adduser libfontconfig1
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.1.linux-amd64.tar.gz
RUN tar -zxvf grafana-6.7.1.linux-amd64.tar.gz
RUN dpkg grafana-6.7.1.linux-amd64.deb
RUN apk add grafana-6.7.1.linux-amd64.deb
COPY ./srcs/grafana/grafana.ini /etc/grafana/.
RUN service grafana-server start