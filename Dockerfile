FROM openjdk:11
# FROM maven


## Install maven
#RUN apt-get update
#RUN apt-get install -y maven

# WORKDIR /code

# Prepare by downloading dependencies
# ADD pom.xml /code/pom.xml
EXPOSE 8090
ADD target/Banking-app.jar /Banking-app.jar
#RUN ["mvn", "dependency:resolve"]
# RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
# ADD src /code/src
# RUN ["mvn", "package", "-DskipTests"]

CMD ["java", "-jar", "/Banking-app.jar"]