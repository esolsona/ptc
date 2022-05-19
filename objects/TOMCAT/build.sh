#!/bin/bash

IMAGE=tomcat8-portic

cd $(dirname $0)
oc login -u developer -p developer https://api.crc.testing:6443 -n portic-devops --insecure-skip-tls-verify || exit 1


docker build . -t default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:${BUILD_NUMBER}
docker login default-route-openshift-image-registry.apps-crc.testing/portic-devops -u ${USER} -p ${PASS}
docker push default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:${BUILD_NUMBER}
docker push default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:latest

oc delete configmap tomcat-serverxml --ignore-not-found=true
oc delete configmap tomcat-prometheus-config --ignore-not-found=true
oc delete configmap tomcat-setenv --ignore-not-found=true

oc create configmap tomcat-serverxml --from-file conf/server.xml
oc create configmap tomcat-prometheus-config --from-file conf/tomcat.yml
oc create configmap tomcat-setenv --from-file bin/setenv.sh

oc apply -f deployment_tomcat.yaml 
oc apply -f tomcat-service.yaml
oc apply -f route-tomcat8.yaml
