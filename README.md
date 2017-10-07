Kafka in Docker
===============

Apache Kafka is a distributed streaming platform.

This repo is based on some examples found on the Internet that I can't find origin of anymore.

How to Run
----------

The man purpuse of this image is to be used as a part of development/test setup using Docker.

Following setting can be provided using env variables:

* `KAFKA_CREATE_TOPICS` — topics to create on startup: `name:partitions:replication_factor`, e.g. `data:1:1`.
* `KAFKA_ZOOKEEPER_CONNECT` — connection string for the zookeeper.

You can run this container with `docker-compose` using following `docker-compose.yml` file as an example:

```
version: '3'

services:
  zookeeper:
    image: antlypls/zookeeper
    ports:
      - "2181:2181"

  kafka:
    image: antlypls/kafka
    ports:
      - "9092:9092"
    depends_on:
      - zookeeper
    environment:
      KAFKA_CREATE_TOPICS: "data:1:1"
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
```

How to Build from Source
------------------------

```
docker build -t antlypls/kafka .
```
