FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

USER root

ADD ./sources/install.sh /home/docker/script/install.sh
ADD ./sources/vsftpd.conf /tmp/vsftpd.conf

EXPOSE 21 21000 21010

ENTRYPOINT ["sh", "/home/docker/script/install.sh"]