FROM jenkins/jenkins:2.332.2-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release curl  podman uidmap vim nodejs npm maven git \
&& alias docker=podman
RUN touch /etc/sub{u,g}id \
   &&  usermod --add-subuids 10000-75535 $(whoami) \
   &&  usermod --add-subgids 10000-75535 $(whoami)

ENTRYPOINT /sbin/tini -- /usr/local/bin/jenkins.sh