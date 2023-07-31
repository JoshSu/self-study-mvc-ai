# Stage 1: Maven build
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

# Copying pom.xml and source code to the container
COPY pom.xml ./
COPY src ./src

# Package the application
RUN mvn clean package

# Stage 2: Tomcat
FROM tomcat:10-jdk17-openjdk-slim
RUN apt-get update && apt-get install -y curl
COPY --from=build /app/target/self-study-mvc-ai-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exposing port 8080 to outside world
EXPOSE 8080

CMD ["catalina.sh", "run"]