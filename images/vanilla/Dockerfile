FROM openjdk:8u151-jre-alpine

LABEL maintainer="matt@craven.cloud"
LABEL maintainer_name="Matt Craven"
LABEL version="0.1"
LABEL description="A Java based Minecraft Server"

RUN apk upgrade --update && \
    apk add --update \
    bash \
    jq \
    wget \
    curl \
    python \
    python-dev \
    py2-pip

RUN pip install --upgrade pip && \
    pip install mcstatus

HEALTHCHECK CMD mcstatus localhost ping

# Environment variables for Java
ENV SRV_MAXHEAP "2048"
ENV SRV_MINHEAP "1024"
ENV SRV_CPUCOUNT "1"
ENV JAR_FILENAME "minecraft_server.jar"

RUN mkdir -p /opt/minecraft

COPY containerfs /

WORKDIR /opt/minecraft

RUN wget $( python minecraftCMD.py ) -O ${JAR_FILENAME}

RUN chmod a+x /opt/minecraft/start.sh

ENTRYPOINT ["./start.sh"]
