# Stage 1: Build the jar using Maven
FROM maven:3.8.3-openjdk-17 AS builder
WORKDIR /app

COPY . .
RUN mvn clean package -DskipTests=true

# Stage 2: Run the application
FROM eclipse-temurin:17-alpine
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
