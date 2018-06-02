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
ENV SRV_MAXHEAP "1024"
ENV SRV_MINHEAP "1024"
ENV SRV_CPUCOUNT "1"
ENV SRV_SERVICE "minecraft_server.jar"
ENV SRV_OPTIONS "nogui"

# Environment variables for server download
ENV VERSION "latest"

RUN mkdir -p /opt/minecraft

COPY containerfs /opt/minecraft

RUN chmod a+x /opt/minecraft/start.sh

WORKDIR /opt/minecraft

CMD ["./start.sh"]
