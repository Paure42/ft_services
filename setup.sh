#!/bin/sh

#Install dependencies

#printf "user42\nuser42" | sudo -S bash install.sh

minikube start --driver=docker
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

docker build -t phpmyadmin-alpine ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
docker build -t mysql-alpine ./srcs/mysql
docker build -t wordpress-alpine ./srcs/wordpress
docker build -t ftps-alpine ./srcs/ftps
docker build -t influxdb-alpine ./srcs/influxdb
docker build -t grafana-alpine ./srcs/grafana
docker build -t telegraf-alpine ./srcs/telegraf

kubectl apply -f ./srcs/Configmap.yaml
kubectl apply -f ./srcs/secret.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/telegraf/telegraf.yaml
docker build -t nginx-alpine ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

minikube dashboard
