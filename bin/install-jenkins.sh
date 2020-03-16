#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

DOCKER_COMPOSE_EXE=$(which docker-compose)

if [ -f $DOCKER_COMPOSE_EXE ]; then
    docker image inspect jenkins:latest >/dev/null 2>&1 && {
        echo "Jenkins is already installed."
    } || {

        echo ""
        echo "Installing jenkins on docker..."

        echo "Build jenkins image on docker..."
        docker image build ./env/jenkins -t jenkins:latest

        echo "Composing jenkins image on docker..."
        docker-compose -f ./env/jenkins/docker-compose.yaml up -d
        
        echo "Adding user to group..."
        sudo usermod -a -G docker root

        echo ""
        echo "Jenkins installed on docker." 
    }
else
    echo "Docker compose not installed."
fi