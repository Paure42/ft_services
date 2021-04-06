FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

ADD ./sources/install.sh /home/docker/script/install.sh
ADD ./sources/influxdb.conf /tmp/influxdb.conf

EXPOSE 8086

CMD ["sh","/home/docker/script/install.sh"]