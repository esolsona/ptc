#!/bin/bash
echo "No executar el script!!"
exit 0

oc delete configmap tomcat-serverxml --ignore-not-found=true
oc delete configmap tomcat-prometheus-config --ignore-not-found=true
oc delete configmap tomcat-setenv --ignore-not-found=true

oc create configmap tomcat-serverxml --from-file conf/server.xml
oc create configmap tomcat-prometheus-config --from-file conf/tomcat.yml
oc create configmap tomcat-setenv --from-file bin/setenv.sh



