FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

USER root

ADD ./sources/install_nginx.sh /home/docker/script/install_nginx.sh
ADD ./sources/nginx.conf /tmp/nginx.conf
ADD ./sources/index.html /var/www/localhost/htdocs/index.html
ADD ./sources/sshd_config /tmp/sshd_config

EXPOSE 80 443 22
ENTRYPOINT ["sh", "/home/docker/script/install_nginx.sh"]
