FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/app.war /usr/local/tomcat/webapps/app.war

EXPOSE 8080
