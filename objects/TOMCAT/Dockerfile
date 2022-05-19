FROM redhat/ubi8

LABEL MAINTAINER=cmajo@kyndryl.com
ENV DOWNLOAD_URL="https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz"

RUN yum install -y wget gzip java-1.8.0-openjdk.x86_64 procps-ng && \
    yum clean all && \
    rm -rf /var/cache/yum
RUN useradd -md /home/tomcat -u 1001 tomcat

USER tomcat

WORKDIR /home/tomcat

RUN wget  ${DOWNLOAD_URL} -O tomcat.tar.gz && \
    tar -xvzf tomcat.tar.gz && rm -f tomcat.tar.gz && chown -R tomcat:tomcat /home/tomcat/ && mv apache-tomcat-* apache-tomcat &&  chmod a+x /home/tomcat/apache-tomcat/bin/*
RUN rm -rf /home/tomcat/apache-tomcat/webapps/*
ADD https://tomcat.apache.org/tomcat-5.5-doc/appdev/sample/sample.war /home/tomcat/apache-tomcat/webapps/
RUN wget https://carles.jfrog.io/artifactory/maven-libs-release/io/happycoding/hello-world-maven/1/hello-world-maven-1.war --user portic --password 51005100Ies4ea@@@ -O /tmp/hello-world-maven-1.war
COPY /tmp/hello-world-maven-1.war /home/tomcat/apache-tomcat/webapps/

COPY bin/ /home/tomcat/apache-tomcat/bin/
COPY conf/ /home/tomcat/apache-tomcat/conf/
COPY lib/ /home/tomcat/apache-tomcat/lib/

USER root
#Parametros del prometheus se definen en setenv.sh
RUN chmod a+x /home/tomcat/apache-tomcat/bin/setenv.sh
USER tomcat
EXPOSE 8080/tcp

#Puerto Prometheus
EXPOSE 8686/tcp

ENV PATH ${PATH}:/home/tomcat/apache-tomcat/bin/

CMD ["catalina.sh", "run"]


