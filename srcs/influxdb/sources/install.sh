#!/bin/sh

apk add openrc --no-cache
apk add influxdb

openrc
touch /run/openrc/softlevel
rc-service influxdb start

rm /etc/influxdb.conf
mv /tmp/influxdb.conf /etc/

sleep 5

influx << EOF
CREATE DATABASE influxdb;
CREATE USER 'admin' WITH PASSWORD 'admin' WITH ALL PRIVILEGES;
GRANT ALL ON 'influxdb' TO 'admin';
EOF

rc-service influxdb stop

influxd -config /etc/influxdb.conf