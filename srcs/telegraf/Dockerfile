FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

ADD ./sources/install.sh /home/docker/script/install.sh
ADD ./sources/telegraf.conf /tmp/telegraf.conf

EXPOSE 8125

ENTRYPOINT ["sh", "/home/docker/script/install.sh"]