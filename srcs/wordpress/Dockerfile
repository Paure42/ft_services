FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

ADD ./sources/install_wp.sh /home/docker/script/install_wp.sh
ADD ./sources/install_nginx.sh /home/docker/script/install_nginx.sh
ADD ./sources/wp-config.php .
ADD ./sources/nginx.conf /tmp/nginx.conf

RUN chmod 777 /home/docker/script/install_wp.sh
RUN chmod +x /home/docker/script/install_nginx.sh

EXPOSE 5050 80

ENTRYPOINT ["/home/docker/script/install_wp.sh"]