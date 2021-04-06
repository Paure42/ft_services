#!/bin/sh

apk upgrade
apk update
apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mkdir /www
mv /wordpress/* /www
mv wp-config.php /www/wp-config.php

sh /home/docker/script/install_nginx.sh

php -S 0.0.0.0:5050 -t /www/