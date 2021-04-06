#!/bin/bash
apk update
apk add nginx openrc

touch /run/openrc/softlevel

cp /tmp/nginx.conf /etc/nginx/nginx.conf
rm /etc/nginx/conf.d/default.conf
mv /tmp/nginx.conf /etc/nginx/conf.d/default.conf


mkdir -p /run/nginx

service nginx restart