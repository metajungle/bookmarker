FROM tomcat:8-jre8-alpine
MAINTAINER Jakob Henriksson <jhenriksson@i-a-i.com> 

# install bash in alpine 
RUN apk add --update bash && rm -rf /var/cache/apk/*

# configure Tomcat
ENV CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xms512M -Xmx1G -XX:MaxPermSize=512M -XX:+UseConcMarkSweepGC -DTOMCAT_ROOT_CONFIG=/root/tomcat-root-application-config.groovy 

# remove existing applications
RUN rm -fr /usr/local/tomcat/webapps

# copy ROOT application 
COPY build/libs/bookmarker-0.1.war /usr/local/tomcat/webapps/ROOT.war 

# copy configuration file 
#COPY application-config.groovy /root/tomcat-root-application-config.groovy 

# ports
EXPOSE 8080

# run application 
CMD ["catalina.sh", "run"] 
