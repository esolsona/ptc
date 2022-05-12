FROM jenkins/jenkins:2.332.2-jdk11
USER root
RUN apt update && apt install -y docker-compose
COPY DEPLOYMENT/ca.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates 
ENV DOCKER_HOST=192.168.1.116:2375
ENTRYPOINT /sbin/tini -- /usr/local/bin/jenkins.sh
