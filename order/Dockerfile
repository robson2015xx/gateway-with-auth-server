FROM openjdk:latest
ARG JAR_FILE=target/order.jar
ADD ${JAR_FILE} order.jar
ENTRYPOINT ["java","-jar","/order.jar"]