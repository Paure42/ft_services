#!/bin/sh
apk add vsftpd openssl
apk add openrc --no-cache

openrc
touch /run/openrc/softlevel

openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
        -keyout /etc/ssl/private/vsftpd.key \
        -out /etc/ssl/certs/vsftpd.crt -subj \
        "/C=FR/ST=Lyon/L=Lyon/O=42Lyon, Inc./OU=42/CN=ft_services"

rm /etc/vsftpd/vsftpd.conf
mv /tmp/vsftpd.conf /etc/vsftpd/

mkdir -p /home/ftp
adduser -D /home/ftp $FTPS_USER
echo $FTPS_USER:$FTPS_PASSWORD| chpasswd
chown $FTPS_USER:$FTPS_USER /home/ftp
chmod 555 /home/ftp

rc-update add vsftpd default
rc-service vsftpd restart

vsftpd /etc/vsftpd/vsftpd.conf