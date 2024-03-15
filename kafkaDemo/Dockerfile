FROM openjdk:latest
ARG JAR_FILE=target/kafkaDemo.jar
ADD ${JAR_FILE} kafkaDemo.jar
ENTRYPOINT ["java","-jar","/kafkaDemo.jar"]