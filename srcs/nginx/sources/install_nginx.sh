#!/bin/sh
apk update
apk add nginx openssl openssh

yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.pem


rm /etc/nginx/conf.d/default.conf
cp /tmp/nginx.conf /etc/nginx/nginx.conf 
cp /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

ssh-keygen -A
cp /tmp/sshd_config /etc/ssh/sshd_config

adduser -D $SSH_USER
echo $SSH_USER:$SSH_PASSWORD | chpasswd

mkdir -p /run/nginx

/usr/sbin/sshd ; nginx -g "daemon off;"