#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

sh ./bin/verify-mode.sh

echo ""
echo "Uninstalling docker..."
echo ""

sudo yum remove docker-engine -y
sudo yum remove docker -y
sudo yum remove docker.io -y
sudo yum remove docker-ce -y
sudo yum remove docker-ce-cli -y

sh ./bin/uninstall-docker-data.sh

echo ""
echo "Docker removed."
echo ""