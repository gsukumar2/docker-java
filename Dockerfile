# Step : build and package
FROM maven:3.6.1-jdk-8-alpine as BUILD
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ /build/src/
RUN mvn package

# Step : final docker image
FROM openjdk:8u212-jre-alpine3.9
EXPOSE 8080
COPY --from=BUILD /usr/apt/target /opt/target
WORKDIR /opt/target
CMD ["java", "jar", "hellojavadocker.jar"]