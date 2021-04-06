#!/bin/sh

apk upgrade
apk update
apk add bash php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /www
rm -rf /var/cache/apk/*

cp config.inc.php /www/config.inc.php

sh /home/docker/script/install_nginx.sh

php -S 0.0.0.0:5000 -t /www/