#!/bin/sh

apk update
apk add mariadb mariadb-client openrc

mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old_mariadb-server.cnf
sed 's/^skip-networking/#&/' /etc/my.cnf.d/old_mariadb-server.cnf > /etc/my.cnf.d/mariadb-server.cnf
rm /etc/my.cnf.d/old_mariadb-server.cnf

# Config Openrc and start Mariadb
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start

sleep 5

# Create Database wordpress
mysql << EOF 
CREATE DATABASE wordpress;
CREATE USER 'root'@'%' IDENTIFIED BY 'password';
GRANT ALL ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

if [ ! -f /var/lib/mysql/wordpress ]; then
	mysql -h localhost wordpress < /tmp/wordpress.sql
fi
rc-service mariadb stop
/usr/bin/mysqld --user=root --datadir="/var/lib/mysql"