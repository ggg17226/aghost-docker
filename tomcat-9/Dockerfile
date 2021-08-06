FROM agh0st/jdk:11.0.11p9-20210729
WORKDIR /app
RUN bash -c "curl -q -o /app/tomcat.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz &&\
tar xf /app/tomcat.tar.gz -C /app/ && rm /app/tomcat.tar.gz && mv apache-tomcat-9.0.50/* /app/ && rm -rf apache-tomcat-9.0.50 && rm -rf /app/bin/*.bat &&\
rm -rf /app/webapps/docs /app/webapps/examples /app/webapps/manager /app/webapps/host-manager && \
sed -i 's/1catalina.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs/1catalina.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs\/\${APP_VERSION}-\${HOSTNAME}\//' /app/conf/logging.properties && \
sed -i 's/2localhost.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs/2localhost.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs\/\${APP_VERSION}-\${HOSTNAME}\//' /app/conf/logging.properties && \
sed -i 's/3manager.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs/3manager.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs\/\${APP_VERSION}-\${HOSTNAME}\//' /app/conf/logging.properties && \
sed -i 's/4host-manager.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs/4host-manager.org.apache.juli.AsyncFileHandler.directory = \${catalina.base}\/logs\/\${APP_VERSION}-\${HOSTNAME}\//' /app/conf/logging.properties && \
"

CMD ${PRE_EXEC_CMD} \
    mkdir -p /app/logs/${APP_VERSION}-${HOSTNAME}/heap_dump ;\
    mkdir -p /app/logs/${APP_VERSION}-${HOSTNAME}/gc ;\
    /usr/lib/jvm/java-11-openjdk-amd64/bin/java -server \
    -Xmx${HEAP_MEM_SIZE:-512}m -Xms16m \
    -XX:MetaspaceSize=32m \
    -XX:MaxMetaspaceSize=${META_MEM_SIZE:-128}m \
    -XX:OnOutOfMemoryError="kill -9 %p" \
    -XX:+UnlockExperimentalVMOptions -XX:+UseZGC \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:HeapDumpPath=/app/logs/${APP_VERSION}-${HOSTNAME}/heap_dump/java_heapdump.hprof \
    ${EXT_JVM_CMD} \
    -Dfile.encoding=UTF-8 \
    -Xlog:gc*:file=/app/logs/${APP_VERSION}-${HOSTNAME}/gc/gc.log:time,tags:filecount=10,filesize=102400 \
    ${EXT_APM_CMD} \
    -DAPP_VERSION=${APP_VERSION:-V1} -DHOSTNAME=${HOSTNAME} \
    -Djava.util.logging.config.file=/app/conf/logging.properties \
    -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager \
    -Djdk.tls.ephemeralDHKeySize=2048 \
    -Djava.protocol.handler.pkgs=org.apache.catalina.webresources \
    -Dorg.apache.catalina.security.SecurityListener.UMASK=0027 \
    -Dignore.endorsed.dirs="" \
    -classpath "/app/bin/bootstrap.jar:/app/bin/tomcat-juli.jar" \
    -Dcatalina.base="/app" \
    -Dcatalina.home="/app" \
    -Djava.io.tmpdir="/app/temp" \
    ${EXT_JVM_APP_CMD} \
    org.apache.catalina.startup.Bootstrap start \
    ${EXT_APP_CMD}