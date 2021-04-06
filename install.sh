#!/bin/bash

sudo apt-get upgrade -y
sudo apt-get update -y

#Install docker
docker -v
if [[ $? != 0 ]]
then
sudo apt-get install -y  curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install -y docker-ce
fi

export sudo='sudo'
$sudo usermod -aG sudo $USER
newgrp docker

kubectl --help
if [[ $? != 0 ]]
then
#Install kubectl
sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y 
sudo apt-get install -y kubectl
fi

minikube version
if [[ $? != 0 ]]
then
#Install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
 && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
rm minikube
fi