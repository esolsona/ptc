JENKINS
==============

PVC:
  - jenkins-pvc	--> /var/jenkins_home (RWO)

ENV:
  - DOCKER_HOST: tcp://ip_servei_dockerdind:2375/2376(si te tls)

PORTS:
  - 8080/tcp: Port web
  - 50000/tcp: Agent jenkins (jnlp)


PENDENT:
  - Configurar CM per als certificats de openshift (update-ca-certificates)
