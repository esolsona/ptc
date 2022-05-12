#!/bin/sh 
set -m
#podman system migrate
cd /tmp
dockerd &

alias docker="sudo docker"
#chmod 666 /var/run/docker.sock

#/sbinoecho "/tini -- /usr/local/bin/jenkins.sh
echo "¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿"
whoami
echo "¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿"
/opt/bitnami/scripts/jenkins/entrypoint.sh /opt/bitnami/scripts/jenkins/run.sh
