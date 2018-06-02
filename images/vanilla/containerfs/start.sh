#!/bin/bash
export VERSIONS_JSON=https://launchermeta.mojang.com/mc/game/version_manifest.json
export SERVER="minecraft_server.jar"
export VERSION="${VERSION:-latest}"

function getMinecraftLatest {
    echo "Checking version information."
    export VANILLA_VERSION=`curl -fsSL ${VERSIONS_JSON} | \
    jq -r '.latest.release'`
    echo "Downloading latest stable ${SERVER} ..."
    wget -q -O ${SERVER} \
    $(curl -s $(\
    curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | \
    jq \
    --arg VANILLA_VERSION "${VANILLA_VERSION}" \
    --raw-output '[.versions[]|select(.id == $VANILLA_VERSION)][0].url') | \
    jq \
    --raw-output '.downloads.server.url')
}

function getMinecraftSnapshot {
    echo "Checking version information."
    export VANILLA_VERSION=`curl -fsSL ${VERSIONS_JSON} | \
    jq -r '.latest.snapshot'`
    echo "Downloading latest snapshot of ${SERVER} ..."
    wget -q -O ${SERVER} \
    $(curl -s $(\
    curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | \
    jq \
    --arg VANILLA_VERSION "${VANILLA_VERSION}" \
    --raw-output '[.versions[]|select(.id == $VANILLA_VERSION)][0].url') | \
    jq \
    --raw-output '.downloads.server.url')
}

if [ ! -f ${SERVER} ]
then
    if [[ "${VERSION}" = "latest" ]]
    then
        getMinecraftLatest
    elif [[ "${VERSION}" = "snapshot" ]]
    then
        getMinecraftSnapshot
    fi
fi

java -Xmx${SRV_MAXHEAP}M -Xms${SRV_MINHEAP}M -XX:+UseConcMarkSweepGC \
-XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${SRV_CPUCOUNT} -XX:+AggressiveOpts \
-jar ${SRV_SERVICE} ${SRV_OPTIONS}
