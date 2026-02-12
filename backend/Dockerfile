FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

RUN ls
RUN pwd
RUN whoami

RUN ./mvnw clean package -DskipTests
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

EXPOSE 8080
