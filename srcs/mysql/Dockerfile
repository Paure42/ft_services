FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

ADD ./sources/install_mysql.sh /home/docker/script/install_mysql.sh
ADD ./sources/wordpress.sql /tmp/wordpress.sql

RUN chmod 777 /home/docker/script/install_mysql.sh

EXPOSE 3306

CMD ["sh", "/home/docker/script/install_mysql.sh"]
