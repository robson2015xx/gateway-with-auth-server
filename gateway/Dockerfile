FROM openjdk:latest
ARG JAR_FILE=target/gateway.jar
ADD ${JAR_FILE} gateway.jar
ENTRYPOINT ["java","-jar","/gateway.jar"]