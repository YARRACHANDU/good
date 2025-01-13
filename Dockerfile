FROM maven:3.8.5-openjdk-17 As build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/happy-0.0.1-SNAPSHOT.jar login-page.jar  
EXPOSE 8080
ENTRYPOINT ["java","-jar","login-page.jar"]