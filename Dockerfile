FROM maven:3.4.1-jdk-21 As build
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:21-jdk-slim
COPY --from=build/target/good-0.0.1-SNAPSHOT.jar good.jar good.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","good.jar"]