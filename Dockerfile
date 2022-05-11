FROM docker.io/redhat/ubi8

LABEL MAINTAINER=cmajo@kyndryl.com

RUN yum install -y wget gzip java-1.8.0-openjdk.x86_64 procps-ng && \
    yum clean all && \
    rm -rf /var/cache/yum
RUN useradd -md /home/tomcat -u 1001 tomcat

USER tomcat
WORKDIR /home/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz -O tomcat.tar.gz && \
    tar -xvzf tomcat.tar.gz && rm -f tomcat.tar.gz && chown -R tomcat:tomcat /home/tomcat/ && chmod a+x /home/tomcat/apache-tomcat-8.5.78/bin/*
    
ADD https://tomcat.apache.org/tomcat-5.5-doc/appdev/sample/sample.war /home/tomat/webapps/

EXPOSE 8080/tcp

ENV PATH ${PATH}:/home/tomcat/apache-tomcat-8.5.78/bin/

CMD ["catalina.sh", "run"]


