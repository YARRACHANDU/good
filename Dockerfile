FROM openjdk:17
EXPOSE 8080
ADD target/happy.jar happy.jar
ENTRYPOINT ["java","-jar","/happy.jar"]