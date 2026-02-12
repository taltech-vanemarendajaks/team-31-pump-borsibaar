FROM eclipse-temurin:21-jdk AS build
WORKDIR /home/ubuntu/actions-runner/_work/team-31-pump-borsibaar/team-31-pump-borsibaar/backend

RUN ls
RUN pwd
RUN whoami

RUN ./mvnw clean package -DskipTests
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8080
