FROM docker.io/redhat/ubi8

LABEL MAINTAINER=cmajo@kyndryl.com
USER root
WORKDIR /home/tomcat
RUN yum install -y wget gzip java-1.8.0-openjdk.x86_64 procps-ng && useradd -md /home/tomcat -u 1001 tomcat && wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz -O tomcat.tar.gz && \
    tar -xvzf tomcat.tar.gz && rm -f tomcat.tar.gz  && chmod a+x /home/tomcat/apache-tomcat-8.5.78/bin/*
ADD https://tomcat.apache.org/tomcat-5.5-doc/appdev/sample/sample.war /home/tomcat/apache-tomcat-8.5.78/webapps/
COPY daemon.json /etc/docker/
RUN chown -R tomcat:tomcat /home/tomcat/ 
USER tomcat
EXPOSE 8080/tcp

ENV PATH ${PATH}:/home/tomcat/apache-tomcat-8.5.78/bin/

CMD ["catalina.sh", "run"]


