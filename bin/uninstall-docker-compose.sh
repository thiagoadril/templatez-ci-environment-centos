#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

sh ./bin/verify-mode.sh

DOCKER_COMPOSE_EXE=$(which docker-compose)

echo "Uninstalling docker compose..."
echo ""

if [ -f $DOCKER_COMPOSE_EXE ]; then
    sudo rm $DOCKER_COMPOSE_EXE
fi

echo ""
echo "Docker compose removed."