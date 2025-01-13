FROM maven:3.4.1-openjdk-21 As build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21.0.1-jdk-slim
COPY --from=build/target/login-page-0.0.1-SNAPSHOT.jar login-page.jar login-page.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","login-page.jar"]