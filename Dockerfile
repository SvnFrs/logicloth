#Use the Maven image as the build stage
FROM maven:3.9.0 AS build

RUN mvn --version
RUN java -version

WORKDIR /app
COPY . .

RUN mvn clean install

FROM tomcat:10.0.23-jdk8-temurin-jammy

WORKDIR /usr/local/tomcat/webapps

COPY --from=build /app/target/FoodWeb-1.0-SNAPSHOT.war ROOT.war


EXPOSE 8080
COPY setenv.sh /usr/local/tomcat/bin/setenv.sh

CMD ["catalina.sh", "run"]