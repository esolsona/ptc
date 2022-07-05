#!/bin/bash
podman build . -t console-openshift-console.apps.clocpd00.portic.net/devops-pre/jenkins:latest
podman login console-openshift-console.apps.clocpd00.portic.net/devops-pre -u developer -p $(oc whoami -t)
podman push console-openshift-console.apps.clocpd00.portic.net/devops-pre/jenkins:latest

oc apply -f jenkins_deployment.yaml
oc apply -f jenkins-route.yaml
oc apply -f jenkins-svc.yaml

oc set image deployment/jenkins2 container-0=default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:latest
oc scale --replicas=1 deployment/jenkins2
