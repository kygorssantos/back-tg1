# Estágio 1: Compilar a aplicação usando Maven e Java 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -DskipTests

# Estágio 2: Executar a aplicação usando Java 21 estável e leve
FROM eclipse-temurin:21-jre-jammy
COPY --from=build /target/banco-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]