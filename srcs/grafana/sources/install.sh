#!/bin/sh

apk add wget openrc

wget https://dl.grafana.com/oss/release/grafana-7.3.2.linux-amd64.tar.gz
tar -zxvf grafana-7.3.2.linux-amd64.tar.gz

rm -r grafana-7.3.2.linux-amd64.tar.gz

mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

mkdir -p /etc/grafana/dashboards

mv ./influxdb-docker.json	/etc/grafana/dashboards/
mv ./dashboard.yaml 		/grafana-7.3.2/conf/provisioning/dashboards/
mv ./datasource.yaml 		/grafana-7.3.2/conf/provisioning/datasources/

cd /grafana-7.3.2/bin

./grafana-server

#http://influxdb-service.default.svc.cluster.local:8086
#import 1150 panel