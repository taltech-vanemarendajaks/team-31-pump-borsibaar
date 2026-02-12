FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

RUN ./mvnw clean package -DskipTests
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

EXPOSE 8080
