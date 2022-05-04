#!/bin/sh 
set -m
dockerd &
/sbin/tini -- /usr/local/bin/jenkins.sh
