#!/bin/bash
podman build . -t default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:3.0 
podman login default-route-openshift-image-registry.apps-crc.testing/portic-devops -u developer -p $(oc whoami -t) 
podman push default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:3.0
oc set image deployment/jenkins2 container-0=default-route-openshift-image-registry.apps-crc.testing/portic-devops/jenkins-portic:3.0
oc scale --replicas=1 deployment/jenkins2
