#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

echo ""
echo "Clearing old dependencies..."
echo ""

sudo yum remove docker -y
sudo yum remove docker-client -y
sudo yum remove docker-client-latest -y
sudo yum remove docker-common -y
sudo yum remove docker-latest -y
sudo yum remove docker-latest-logrotate -y
sudo yum remove docker-logrotate -y
sudo yum remove docker-engine -y
sudo yum remove docker-ce -y

sh ./bin/uninstall-docker-data.sh

echo ""
echo "Installing docker..."

sudo yum check-update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 -y
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
sudo dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm -y
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker root
sudo systemctl start docker
sudo systemctl enable docker

echo ""
echo "Docker installed..."