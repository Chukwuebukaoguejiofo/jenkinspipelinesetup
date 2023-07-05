#!/bin/bash
#setting up Docker
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl start docker
sudo service docker status
sudo groupadd docker
sudo usermod -a -G docker ec2-user
sudo newgrp docker
sudo docker pull jenkins/jenkins 
sudo docker images
sudo mkdir jenkins 
sudo docker run -d --name jenkins -p 8080:8080 -v $PWD/jenkins/ jenkins/jenkins
sudo docker ps

# install git
sudo yum install git -y

# install terraform

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# install kubectl

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin