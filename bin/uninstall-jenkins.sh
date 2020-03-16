#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

echo ""
echo "Uninstalling jenkins on docker..."

DOCKER_COMPOSE_EXE=$(which docker-compose)

if [ -f $DOCKER_COMPOSE_EXE ]; then

    echo "Removing jenkins image on docker..."
    docker stop jenkins
    docker rm jenkins
    docker rmi jenkins:latest

    echo "Removing Composition of jenkins image on docker..."
    docker-compose -f env/jenkins/docker-compose.yaml down

    echo "Removing user to group..."
    sudo gpasswd -d root docker
else
    echo "Docker compose not instaled."
fi

echo ""
echo "Jenkins on docker removed."