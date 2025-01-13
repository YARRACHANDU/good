FROM maven:3.4.1-jdk-21 As build
COPY . .
RUN mvn clean package -DskipTests
WORKDIR /good
FROM openjdk:21-jdk-slim
COPY target/login-page-0.0.1-SNAPSHOT.jar login-page.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","good.jar"]