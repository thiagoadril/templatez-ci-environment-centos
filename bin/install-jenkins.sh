#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

echo ""
echo "Installing jenkins on docker..."

DOCKER_COMPOSE_EXE=$(which docker-compose)

if [ -f $DOCKER_COMPOSE_EXE ]; then
    echo ""

    echo "Build jenkins image on docker..."
    docker image build ./env/jenkins -t jenkins:latest

    echo "Composing jenkins image on docker..."
    docker-compose -f ./env/jenkins/docker-compose.yaml up -d
    
    echo "Adding user to group..."
    sudo usermod -a -G docker root    
else
    echo "Docker compose not instaled."
fi

echo ""
echo "Jenkins on docker installed."