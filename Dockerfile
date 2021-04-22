# Step : build and package
FROM maven:3.8.1-openjdk-11-slim as BUILD
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /build/src/
RUN mvn package

# Step : final docker image
FROM openjdk:11-jre-slim
EXPOSE 8080
COPY --from=BUILD /build/target /opt/target
WORKDIR /opt/target
CMD ["java", "-jar", "hellojavadocker.jar"]
