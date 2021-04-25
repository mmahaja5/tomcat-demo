# Use a minimal image as parent
FROM openjdk:8-jdk-alpine

# Environment variables
ENV TOMCAT_MAJOR=9 \
    TOMCAT_VERSION=9.0.45 \
    CATALINA_HOME=/opt/tomcat

COPY startup.sh /opt/startup.sh


USER root
# init
RUN apk -U upgrade --update && \
    apk add curl && \
    apk add ttf-dejavu

RUN mkdir -p /opt

# install tomcat
RUN curl -jkSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    gunzip /tmp/apache-tomcat.tar.gz && \
    tar -C /opt -xf /tmp/apache-tomcat.tar && \
    ln -s /opt/apache-tomcat-$TOMCAT_VERSION $CATALINA_HOME

# cleanup
RUN apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

RUN chmod -R ga+wr /opt/apache-tomcat-$TOMCAT_VERSION/conf/*

RUN chmod 777 /opt/startup.sh
RUN chmod -R 777 /opt/*
RUN chmod -R 777 /opt/apache-tomcat-$TOMCAT_VERSION/webapps/

EXPOSE 8080


RUN chown -R 1004680000 /usr/.
RUN chown -R 1004680000 /opt/.
RUN chmod 777 -R /opt/tomcat
RUN chmod 777 -R /opt/tomcat/temp

USER 1004680000

ENTRYPOINT /opt/startup.sh

WORKDIR $CATALINA_HOME
