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
    docker image build -t jenkins:latest -f env/jenkins/Dockerfile
    docker-compose -f env/jenkins/docker-compose.yaml up -d
else
    echo "Docker compose not instaled."
fi

echo ""
echo "Jenkins on docker installed."