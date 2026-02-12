FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

# Copy everything from current directory into the container
COPY . .

# Make sure mvnw is executable (important on Linux containers)
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Use a smaller runtime image (recommended)
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
