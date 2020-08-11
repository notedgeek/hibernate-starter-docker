FROM maven:3.6.0-jdk-8 as maven
COPY ./pom.xml ./pom.xml
RUN mvn dependency:go-offline -B

COPY ./src ./src
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine
WORKDIR /my-project
COPY --from=maven target/hibernate-starter-0.0.1-SNAPSHOT-jar-with-dependencies.jar ./
CMD ["java", "-jar", "./hibernate-starter-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
