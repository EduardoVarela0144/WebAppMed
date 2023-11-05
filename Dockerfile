FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/eduardo_lpsw-1.jar demo.jar
EXPOSE 9292
ENTRYPOINT ["java","-jar","demo.jar"]