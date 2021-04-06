FROM alpine:latest

MAINTAINER Paure <paure@student.42lyon.fr>

ADD ./sources/install.sh	/home/docker/script/install.sh
ADD ./sources/influxdb-docker.json .
ADD ./sources/dashboard.yaml .
ADD ./sources/datasource.yaml .		

RUN chmod 755 /home/docker/script/install.sh

EXPOSE 3000

CMD ["sh","/home/docker/script/install.sh"]