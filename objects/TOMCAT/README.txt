TOMCAT
=================
NOM CONFIGMAPS 				PUNT MUNTATGE					PERMISOS
tomcat-prometheus-config 	/home/tomcat/apache-tomcat/conf/tomcat.yml 		r--r--...
tomcat-serverxml		/home/tomcat/apache-tomcat/conf/server.xml		r--r--...
tomcat-setenv			/home/tomcat/apache-tomcat/bin/setenv.sh		rx-rx-...


PORTS
8080/tcp --> Port web
3004/tcp --> Port prometheus
8686/tcp --> JMX

SERVEIS
tomcat  --> 8080/tcp
metrics --> 3004/tcp


