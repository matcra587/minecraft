FROM debian:latest

LABEL maintainer="matt@craven.cloud"
LABEL maintainer_name="Matt Craven"
LABEL version="0.1"
LABEL description="A c++ based Minecraft Server"

RUN apt-get update && \
    apt-get install -y \
    git \
    gcc \
    g++ \
    cmake \
    make \
    wget \
    curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/minecraft

WORKDIR /opt/minecraft

RUN curl -sSfL https://download.cuberite.org | sh

COPY containerfs /opt/minecraft

RUN mv /opt/minecraft/Server/* /opt/minecraft/ && \
    rm -rf /opt/minecraft/Server

CMD ["./Cuberite"]
