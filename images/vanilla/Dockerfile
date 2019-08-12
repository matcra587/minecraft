FROM openjdk:12-oraclelinux7

LABEL maintainer="matt@craven.cloud"
LABEL maintainer_name="Matt Craven"
LABEL version="1.0.0"
LABEL description="A Java based Minecraft Server running on OL7"

ENV RELEASEVER=7

RUN yum update --assumeyes && \
    rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-$RELEASEVER https://repo.ius.io/RPM-GPG-KEY-IUS-$RELEASEVER && \
    yum install --assumeyes https://dl.fedoraproject.org/pub/epel/epel-release-latest-$RELEASEVER.noarch.rpm https://repo.ius.io/ius-release-el$RELEASEVER.rpm && \
    yum install --assumeyes python36u python36u-devel python36u-debug python36u-libs python36u-pip python36u-setuptools    

RUN pip3.6 install --upgrade pip && \
    pip3.6 install mcstatus

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
