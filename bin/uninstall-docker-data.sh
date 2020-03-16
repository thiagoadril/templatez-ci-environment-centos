#!/bin/bash
# -----------------------------------------------
# Author    : Thiago Ádril
# E-mail    : me@thiagoadril.com 
# CreatedOn : 2020/03/15
# -----------------------------------------------

DOCKER_DATA_DIR="/var/lib/docker"

echo ""
echo "Checking docker data...."
echo ""

if [ -d "$DOCKER_DATA_DIR" ]; then
    echo "----------------------------------------------"
    echo "          -------[WARNING]-------             "
    echo "    The procedure below is irreversible       "
    echo "----------------------------------------------"
    echo ""
    echo "Custom images, containers, volumes or configuration" 
    echo "files on your host are not automatically removed."
    echo "To delete all images, containers and volumes."
    echo "" 
    echo "Do you want to delete all data '[y/N]'"

    read choice
    if [ "$choice" = 'y' ]; then 
        echo "Removing data..."
        sudo rm -rf /var/lib/docker;
        echo "Data removed."
    fi
fi
