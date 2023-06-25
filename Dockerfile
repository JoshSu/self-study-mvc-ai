# Using a base image that has Java 17 and Tomcat 10
FROM tomcat:10-jdk17-openjdk-slim

# Copying the war file to the webapps directory of Tomcat
COPY target/self-study-mvc-ai-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
# Copying the war file to the webapps directory of Tomcat
COPY target/self-study-mvc-ai-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exposing port 8080 to outside world
EXPOSE 8080
EXPOSE 8081


CMD ["catalina.sh", "run"]
