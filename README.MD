# Dockerised Minecraft images

## Current supported docker images

- Vanilla Minecraft (Java)
- Vanilla Minecraft - Powered by Cuberite (C++)
  - This seems to be better performance wise, but has a lot less plugins available

## Minecraft 1.12 World of Color Update

These docker images are all ready to use the latest version of Minecraft (1.12 World of Color Update)

### Available tags

All available tags are always listed [in Docker Hub](https://hub.docker.com/r/matcra587/minecraft/tags):

- `vanilla`: Latest stable build for Minecraft 1.12.2 (Java).
- `cuberite`: Latest build for Minecraft 1.12.2 (C++)

To use the version 1.12.2 of docker run:

    docker run -d -it -e VERSION=latest -p 25566:25565 sistemics/minecraft:vanilla
    docker run -d -it -p 25565:25565 sistemics/minecraft:cuberite

## Description

This docker image provides a few Minecraft Servers that will automatically download the latest stable version at startup.

### docker-compose

To use the version 1.12.2 of docker run:

    ---
    version: "3"

    services:
      cuberite:
        image: matcra587/minecraft:cuberite
        ports:
          - 25565:25565
          - 8080:8080
        container_name: cubemc
        tty: true
        stdin_open: true

      vanilla:
        image: matcra587/minecraft:vanilla
        ports:
          - 25566:25565
        environment:
          VERSION: latest
        container_name: vanillamc