#!/bin/sh 
set -m
#dockerd &
#sudo /var/jenkins_home/bin/dockerd &
#/tmp/rootless.sh &
#export XDG_RUNTIME_DIR=/var/jenkins_home/.docker/run
export PATH=/var/jenkins_home/bin:$PATH
export DOCKER_HOST=tcp://192.168.1.116:2375
#/sbin/tini -- /usr/local/bin/jenkins.sh
/usr/local/bin/jenkins.sh
