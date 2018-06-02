#!/bin/bash
java -Xmx${SRV_MAXHEAP}M -Xms${SRV_MINHEAP}M -XX:+UseConcMarkSweepGC \
-XX:+CMSIncrementalPacing -XX:ParallelGCThreads=${SRV_CPUCOUNT} -XX:+AggressiveOpts \
-jar ${JAR_FILENAME} ${SRV_OPTIONS}
