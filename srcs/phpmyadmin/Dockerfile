FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

ADD ./sources/install_pma.sh /home/docker/script/install_pma.sh
ADD ./sources/install_nginx.sh /home/docker/script/install_nginx.sh
ADD ./sources/config.inc.php .
ADD ./sources/nginx.conf /tmp/nginx.conf

RUN chmod 777 /home/docker/script/install_pma.sh
RUN chmod +x /home/docker/script/install_nginx.sh

EXPOSE 5000 80

ENTRYPOINT ["sh", "/home/docker/script/install_pma.sh"]