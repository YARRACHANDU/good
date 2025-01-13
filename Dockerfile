FROM openjdk:17
WORKDIR /good
EXPOSE 8080
ADD target/spring-boot-starter-parent.jar spring-boot-starter-parent.jar
ENTRYPOINT ["java","-jar","/spring-boot-starter-parent.jar"]