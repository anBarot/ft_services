FROM alpine:latest
LABEL maintainer="abarot@42.student.fr"

RUN apk update
RUN apk add influxdb 

COPY ./influxd_start.sh .
COPY ./wrapper.sh .
COPY ./create_db.sh .
COPY ./liveness.sh .

RUN mkdir -m 755 /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/.
COPY ./telegraf-1.6.3-static_linux_amd64.tar.gz .
RUN tar xf telegraf-1.6.3-static_linux_amd64.tar.gz && rm telegraf-1.6.3-static_linux_amd64.tar.gz

ENTRYPOINT [ "./wrapper.sh"]
EXPOSE 8086