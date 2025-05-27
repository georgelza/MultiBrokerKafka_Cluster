#!/bin/bash

export COMPOSE_PROJECT_NAME=multi

docker compose exec broker01 kafka-topics \
    --create -topic north \
    --bootstrap-server localhost:9092 \
    --partitions 1 \
    --replication-factor 2 \
    --config retention.ms=1000000

docker compose exec broker02 kafka-topics \
    --create -topic south \
    --bootstrap-server localhost:9093 \
    --partitions 1 \
    --replication-factor 1 \
    --config retention.ms=1000000

 docker compose exec broker03 kafka-topics \
    --create -topic east \
    --bootstrap-server localhost:9094 \
    --partitions 1 \
    --replication-factor 3 \
    --config retention.ms=1000000


# Lets list topics, excluding the default Confluent Platform topics
docker compose exec broker03 kafka-topics \
    --bootstrap-server localhost:9094 \
    --list | grep -v '_confluent' |grep -v '__' |grep -v '_schemas' | grep -v 'default' | grep -v 'docker-connect'


docker compose exec broker03 kafka-topics \
    --bootstrap-server localhost:9094 \
    --describe --topic north

docker compose exec broker01 kafka-topics \
    --bootstrap-server localhost:9092 \
    --describe --topic south

docker compose exec broker02 kafka-topics \
    --bootstrap-server localhost:9093 \
    --describe --topic east

