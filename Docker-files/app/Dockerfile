# # # Build stage
FROM openjdk:11 AS BUILD_IMAGE

RUN apt update && apt install git maven -y
RUN git clone https://github.com/Mexxy-lab/Docker-javaproject.git
RUN cd Docker-javaproject && mvn install

FROM tomcat:9-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=BUILD_IMAGE Docker-javaproject/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

# Stage 1: Build with Maven
# FROM openjdk:11 AS build

# RUN apt-get update && apt-get install -y maven
# WORKDIR /app

# COPY pom.xml .
# COPY src ./src

# RUN mvn clean install

# # Stage 2: Tomcat + app
# FROM tomcat:9.0-jre11

# # ✅ Install netcat for readiness check
# RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# RUN rm -rf /usr/local/tomcat/webapps/*

# COPY --from=build /app/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

# # 🔥 Delete default unpacked ROOT folder so Tomcat re-unpacks from WAR
# RUN rm -rf /usr/local/tomcat/webapps/ROOT

# COPY Docker-files/app/wait-for-rabbitmq.sh /usr/local/bin/wait-for-rabbitmq.sh
# RUN chmod +x /usr/local/bin/wait-for-rabbitmq.sh

# EXPOSE 8080

# CMD ["wait-for-rabbitmq.sh", "vpromq01", "5672"]



