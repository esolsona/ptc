#!/bin/bash

IMAGE=tomcat8-portic

echo "******************"
echo $USER
echo $PASS
echo $BUILD_NUMBER
echo "******************"

cd $(dirname $0)

#Agafem artefactes 
#wget https://carles.jfrog.io/artifactory/maven-libs-release/io/happycoding/hello-world-maven/1/hello-world-maven-1.war --user ${ART_USER} --password ${ART_PASSWD} -O war/hello-world-maven-1.war || { echo "No se ha podido descargar el war del artifactory" && exit 1; }
wget ${ART_URL} --user ${ART_USER} --password ${ART_PASSWD} -O war/hello-world-maven-1.war || { echo "No se ha podido descargar el war del artifactory" && exit 1; }

oc login -u developer -p developer https://api.crc.testing:6443 -n portic-devops --insecure-skip-tls-verify || exit 1

echo "Build ${IMAGE}:${BUILD_NUMBER}"
docker build . -t default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:${BUILD_NUMBER}
docker tag default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:${BUILD_NUMBER} default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:latest

echo "LOGIN REPO:"
docker login default-route-openshift-image-registry.apps-crc.testing/portic-devops -u ${USER} -p ${PASS}
echo "PUSH default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:${BUILD_NUMBER}"
docker push default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:${BUILD_NUMBER}
docker push default-route-openshift-image-registry.apps-crc.testing/portic-devops/${IMAGE}:latest

echo "SET IMAGE"
oc set image --loglevel=2  deployment/tomcat8-portic tomcat8-portic=image-registry.openshift-image-registry.svc:5000/portic-devops/${IMAGE}:${BUILD_NUMBER}

oc delete configmap tomcat-serverxml --ignore-not-found=true
oc delete configmap tomcat-prometheus-config --ignore-not-found=true
oc delete configmap tomcat-setenv --ignore-not-found=true

oc create configmap tomcat-serverxml --from-file conf/server.xml
oc create configmap tomcat-prometheus-config --from-file conf/tomcat.yml
oc create configmap tomcat-setenv --from-file bin/setenv.sh

oc apply -f deployment_tomcat.yaml 
oc apply -f tomcat-service.yaml
oc apply -f route-tomcat8.yaml
