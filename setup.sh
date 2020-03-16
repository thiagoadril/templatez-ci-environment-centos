#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

sh ./bin/verify-mode.sh

UNINSTALLED=0;
INSTALLED=1;

DOCKER_INSTALLED=0;
DOCKER_COMPOSE_INSTALLED=0;

while :
do
    echo "-----------------------------------------------"
    echo "| [CI - Environment Installer [CentOS]]       |"
    echo "|                                             |"
    echo "| [1] - Install Environment                   |"
    echo "| [2] - Uninstall Environment                 |"
    echo "| [3] - Exit                                  |"
    echo "-----------------------------------------------"
    echo ""
    read -p "What is your choice? : " choice_options

    case $choice_options in
    1)
        echo ""
        echo "Starting environment installers..."
        echo "Checking applications..."
        echo "----------------------------------------------"

        # checking docker instaled
        if command -v docker >/dev/null 2>&1; then
            echo "Docker is already installed..."
        else
            chmod +x ./bin/install-docker.sh
            sh ./bin/install-docker.sh
        fi

        # checking docker compose found
        if command -v docker-compose >/dev/null 2>&1; then
            echo "Docker Compose is already installed..."
        else
            chmod +x ./bin/install-docker-compose.sh
            sh ./bin/install-docker-compose.sh
        fi
        
        # checking docker and docker compose found
        if command -v docker >/dev/null 2>&1 && command -v docker-compose >/dev/null 2>&1; then
            chmod +x ./bin/install-jenkins.sh
            sh ./bin/install-jenkins.sh
        else
            echo "Jenkins not installed."
        fi

        echo "----------------------------------------------"
        echo ""
    ;;
    2)
        echo ""
        echo "Starting environment uninstallers..."
        echo "Checking applications..."
        echo ""
        echo "----------------------------------------------"

        # checking docker and docker compose found
        if command -v docker >/dev/null 2>&1 && command -v docker-compose >/dev/null 2>&1; then
            chmod +x ./bin/uninstall-jenkins.sh
            sh ./bin/uninstall-jenkins.sh
        else
            echo "Jenkins not installed."
        fi

        # checking docker instaled
        if command -v docker >/dev/null 2>&1; then
            chmod +x ./bin/uninstall-docker.sh
            sh ./bin/uninstall-docker.sh
        else
            echo "Docker not installed..."
        fi

        # checking docker compose found
        if command -v docker-compose >/dev/null 2>&1; then
            chmod +x ./bin/uninstall-docker-compose.sh
            sh ./bin/uninstall-docker-compose.sh
        else
            echo "Docker Compose not installed..."
        fi

        echo "----------------------------------------------"
        echo ""
    ;;
    3)
        echo ""
        echo "Exiting..."
        exit 1
    ;;
    *)
        echo ""
        echo "Invalid options, please try again..."
        echo ""
        exit 1
    ;;
    esac
done