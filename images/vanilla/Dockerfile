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
ENV JAR_FILENAME "minecraft_server.jar"
ENV SRV_OPTIONS "nogui"
ENV JAVA_OPTS "-Xmx${SRV_MAXHEAP}M -Xms${SRV_MINHEAP}M -XX:+UseConcMarkSweepGC \
    -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${SRV_CPUCOUNT} -XX:+AggressiveOpts \
    -jar ${JAR_FILENAME} ${SRV_OPTIONS}"

RUN mkdir -p /opt/minecraft

COPY containerfs /

WORKDIR /opt/minecraft

RUN wget $( python test.py ) -O ${JAR_FILENAME}

CMD ["java", "${JAVA_OPTS}", "-myargument=true"]
