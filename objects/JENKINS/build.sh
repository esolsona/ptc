#!/bin/bash
podman build . -t default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:latest
podman login default-route-openshift-image-registry.apps-crc.testing/portic-devops -u developer -p $(oc whoami -t)
podman push default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:latest

oc apply -f jenkins_deployment.yaml
oc apply -f jenkins-route.yaml
oc apply -f jenkins-svc.yaml

oc set image deployment/jenkins2 container-0=default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:latest
oc scale --replicas=1 deployment/jenkins2
