FROM openjdk:jre-alpine

RUN apk add --update unzip wget curl jq coreutils bash

ENV KAFKA_VERSION="0.10.2.1" SCALA_VERSION="2.11"
ADD download-kafka.sh /tmp/download-kafka.sh
RUN mkdir /opt && /tmp/download-kafka.sh && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

# Add kafka binaries to PATH
ENV PATH $KAFKA_HOME/bin:$PATH

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD create-topics.sh /usr/bin/create-topics.sh

EXPOSE 9092

CMD ["start-kafka.sh"]
