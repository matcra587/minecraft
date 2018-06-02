FROM openjdk:8u151-jre-alpine

LABEL maintainer="matt@craven.cloud"
LABEL maintainer_name="Matt Craven"
LABEL version="0.1"
LABEL description="A Java based Minecraft Server"

# Environment variables for Java
ENV SRV_MAXHEAP "2048"
ENV SRV_MINHEAP "1024"
ENV SRV_CPUCOUNT "1"
ENV JAR_FILENAME "spigotmc_server.jar"

RUN apk upgrade --update && \
    apk add --update \
    bash \
    jq \
    wget \
    curl \
    git \
    python \
    python-dev \
    py2-pip

RUN pip install --upgrade pip && \
    pip install mcstatus

RUN mkdir -p /opt/mc-build/ && \
    mkdir -p /opt/minecraft/

WORKDIR /opt/mc-build/

RUN wget -O BuildTools.jar \
    https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    java -jar BuildTools.jar

RUN mv spigot-*.jar /opt/minecraft/spigotmc_server.jar

RUN rm -rf /opt/mc-build

HEALTHCHECK CMD mcstatus localhost ping

COPY containerfs /

RUN chmod a+x /opt/minecraft/start.sh

WORKDIR /opt/minecraft

CMD ["./start.sh"]
