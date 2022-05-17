#!/bin/bash
cd $(dirname $0)
oc login -u developer -p developer https://api.crc.testing:6443 -n portic-devops || exit 1

oc delete configmap tomcat-serverxml --ignore-not-found=true
oc delete configmap tomcat-prometheus-config --ignore-not-found=true
oc delete configmap tomcat-setenv --ignore-not-found=true

oc create configmap tomcat-serverxml --from-file conf/server.xml
oc create configmap tomcat-prometheus-config --from-file conf/tomcat.yml
oc create configmap tomcat-setenv --from-file bin/setenv.sh

oc apply -f deployment_tomcat.yaml 