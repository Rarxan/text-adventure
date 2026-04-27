FROM maven:3.9.6-eclipse-temurin-11 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/text-adventure.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]