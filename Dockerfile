FROM alpine:3.5
ENV TIKA_JAR="tika-server.jar" \
    TIKA_MEMORY="1g" \
    TIKA_VERSION="1.16"
LABEL description="Apache Tika Server" \
    version=${TIKA_VERSION}
WORKDIR /usr/share/tika/
RUN apk add --no-cache openjdk8-jre
RUN apk add --no-cache wget
RUN wget https://www.apache.org/dist/tika/tika-server-${TIKA_VERSION}.jar -O /usr/share/tika/${TIKA_JAR}
EXPOSE 9998
ENTRYPOINT java -Xmx${TIKA_MEMORY} -jar /usr/share/tika/${TIKA_JAR} -h 0.0.0.0
