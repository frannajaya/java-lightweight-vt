# ---------- Build stage ----------
FROM maven:3.9.9-eclipse-temurin-21 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

# Package the Spring Boot app (fat jar)
RUN mvn clean package -DskipTests

# ---------- Runtime stage ----------
FROM eclipse-temurin:21-jre-jammy AS runtime

WORKDIR /app
# Copy the jar from builder
COPY --from=builder /app/target/*.jar app.jar

# Set JVM options for low-memory footprint
ENV JAVA_OPTS="-XX:MaxRAMPercentage=90 -XX:+UseSerialGC -XX:+AlwaysPreTouch"

EXPOSE 2000

CMD ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
