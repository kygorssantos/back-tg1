# Estágio 1: Compilar a aplicação
FROM maven:3.8.8-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Estágio 2: Executar a aplicação
FROM openjdk:17-jdk-slim
COPY --from=build /target/Bizi-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]