FROM agh0st/jdk:11.0.8b10-openjdk
RUN mkdir -p /nacos/conf && mkdir -p /nacos/heap_dump/ && mkdir -p /nacos/logs/ && mkdir -p /nacos/plugins/
copy nacos-server.jar /nacos/
CMD cd /nacos;\
mkdir -p /nacos/heap_dump/${HOSTNAME}/ ;\
mkdir -p /nacos/logs/${HOSTNAME}/ ;\
echo ${HOSTNAME} >> /nacos/conf/cluster.conf ;\
/usr/lib/jvm/java-11-openjdk-amd64/bin/java -server \
-Xmx${MEM_SIZE:-512}m -Xms${MEM_SIZE:-512}m \
-XX:+UnlockExperimentalVMOptions -XX:+UseZGC \
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/nacos/heap_dump/${HOSTNAME}/java_heapdump.hprof \
-XX:-UseLargePages -Xlog:gc*:file=/nacos/logs/${HOSTNAME}/nacos_gc.log:time,tags:filecount=10,filesize=102400 \
-Dloader.path=/nacos/plugins/health,/nacos/plugins/cmdb,/nacos/plugins/mysql \
-Dnacos.home=/nacos \
-jar /nacos/nacos-server.jar \
--spring.config.location=classpath:/,classpath:/config/,file:./,file:./config/,file:/nacos/conf/ \
--logging.config=/nacos/conf/nacos-logback.xml \
--server.max-http-header-size=524288 \
${NACOS_LOG_CMD:---nacos.logs.path=/nacos/logs/${HOSTNAME}/} \
${EXT_NACOS_CMD}


