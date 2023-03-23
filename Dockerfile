FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

From maven:latest
WORKDIR /app
COPY . /app
RUN cd /app && mvn clean install -Dskiptests
RUN apt-get update && \
apt-get install -y --no-install-recommends \
        openjdk-8-jdk
RUN java --version
CMD ["java","-jar","/app/target/spring-petclinic-2.7.0-SNAPSHOT.jar"]
