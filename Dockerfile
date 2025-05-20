FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built jar into the image
COPY target/simple_web_maven-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9090

ENTRYPOINT ["java", "-jar", "app.jar"]

#FROM ubuntu:latest
#LABEL authors="Saddam Hossain"
#
#ENTRYPOINT ["top", "-b"]
