FROM jenkins/jenkins:2.332.2-jdk11
USER root
RUN apt update && apt install -y docker-compose
ADD https://downloads-openshift-console.apps-crc.testing/amd64/linux/oc.tar /tmp/
RUN cd /tmp/ && tar -xvzf oc.tar && chmod a+x oc && mv oc /usr/bin/ && rm -f oc.tar 
COPY DEPLOYMENT/ca.crt /usr/local/share/ca-certificates
RUN update-ca-certificates 
ENV DOCKER_HOST=tcp://10.217.4.141:2375
ENTRYPOINT /sbin/tini -- /usr/local/bin/jenkins.sh
