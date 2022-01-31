FROM centos

MAINTAINER rns@rnstech.com

RUN yum update -y
RUN yum -y install java
RUN java -version

#RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.16/bin/apache-tomcat-10.0.16.tar.gz
RUN tar xzvf apache-tomcat-10.0.16.tar.gz -C /opt/
RUN cp -R /opt/apache-tomcat-10.0.16/ /opt/tomcat

WORKDIR /opt/tomcat/webapps
COPY target/webapp.war .

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
