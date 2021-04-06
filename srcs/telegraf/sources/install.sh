#!/bin/sh

apk add wget openrc

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz
tar -C . -xvf telegraf-1.16.1_static_linux_amd64.tar.gz

mkdir /etc/telegraf

chmod +x ./telegraf-1.16.1/usr/bin/telegraf
cp telegraf-1.16.1/usr/bin/telegraf /usr/bin

rm /telegraf-1.16.1/etc/telegraf/telegraf.conf
cp /tmp/telegraf.conf /etc/telegraf/telegraf.conf



/usr/bin/telegraf