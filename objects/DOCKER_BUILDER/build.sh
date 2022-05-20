#!/bin/bash

oc login -u developer -p developer https://api.crc.testing:6443 -n portic-devops --insecure-skip-tls-verify || exit 1
podman login default-route-openshift-image-registry.apps-crc.testing/portic-devops -u developer -p $(oc whoami -t)
podman build . -t default-route-openshift-image-registry.apps-crc.testing/portic-devops/docker-builder2:dind-2
podman push default-route-openshift-image-registry.apps-crc.testing/portic-devops/docker-builder2:dind-2
oc set image deployment/docker-builder2 docker-builder2=default-route-openshift-image-registry.apps-crc.testing/portic-devops/docker-builder2:dind-2 --loglevel=6
