FROM agh0st/jdk:11.0.11p9-20210729
WORKDIR /app
RUN bash -c "curl -q -o /app/tomcat.tar.gz https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz &&\
tar xf /app/tomcat.tar.gz -C /app/ && rm /app/tomcat.tar.gz && mv apache-tomcat-9.0.50/* /app/ && rm -rf apache-tomcat-9.0.50 && rm -rf /app/bin/*.bat &&\
rm -rf /app/webapps/docs /app/webapps/examples /app/webapps/manager /app/webapps/host-manager && \
sed -i 's/1catalina.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs/1catalina.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs\/${APP_VERSION}-${HOSTNAME}\//' /app/conf/logging.properties && \
sed -i 's/2localhost.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs/2localhost.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs\/${APP_VERSION}-${HOSTNAME}\//' /app/conf/logging.properties && \
sed -i 's/3manager.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs/3manager.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs\/${APP_VERSION}-${HOSTNAME}\//' /app/conf/logging.properties && \
sed -i 's/4host-manager.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs/4host-manager.org.apache.juli.AsyncFileHandler.directory = ${catalina.base}\/logs\/${APP_VERSION}-${HOSTNAME}\//' /app/conf/logging.properties "

