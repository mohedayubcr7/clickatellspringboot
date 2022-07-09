FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y update
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install maven
COPY  myApp /myApp
WORKDIR /myApp
RUN mvn clean 
CMD [ "mvn", "spring-boot:run" ]
