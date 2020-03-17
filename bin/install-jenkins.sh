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
        docker image build env/jenkins -t jenkins:latest

        echo "Composing jenkins image on docker..."
        docker-compose -f env/jenkins/docker-compose.yaml up -d
        
        echo "Adding user to group..."
        sudo usermod -a -G docker root

        echo ""
        echo "Jenkins installed on docker." 

        echo ""
        echo "Jenkins instalation secret admin password"
        echo ""

        echo "Automatically waiting 5 minutes for the secret administrator password ..."
        
        SLEEP_TIME_SECONDS=5
        MAX_SEARCHING_COUNTER=1

        # for calculate time use SLEEP_TIME_SECONDS * MAX_SEARCHING_COUNTER => EX: 12*5 = 60 Seconds = 5 Minute

        HAS_SEARCHING_PASSWORD=1
        SEARCHING_COUNTER=0

        while [ $HAS_SEARCHING_PASSWORD -eq 1 ]
        do
            docker container exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword >/dev/null 2>&1 && {
                echo ""
                echo "----------------------------------------------"
                echo "[Found] Admin Secret Password"
                echo "----------------------------------------------"
                docker container exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
                echo "----------------------------------------------"
                echo ""
                HAS_SEARCHING_PASSWORD=0
            } || {
                echo "Waiting..."
            }

            if [ $SEARCHING_COUNTER -eq $MAX_SEARCHING_COUNTER ]; then HAS_SEARCHING_PASSWORD=0;
            elif [ $HAS_SEARCHING_PASSWORD -eq 1 ]; then sleep $SLEEP_TIME_SECONDS;
            fi

            SEARCHING_COUNTER=$(( $SEARCHING_COUNTER + 1 ))
        done

        if [ $HAS_SEARCHING_PASSWORD -eq 1 ]; then 
        
        echo ""
        echo "The administrator's secret password was not found within the allotted time, please perform the procedure manually."
        echo ""
        echo "Try command: docker container exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword"
        echo ""

        fi

        echo ""
    }
else
    echo "Docker compose not installed."
fi