#!/bin/bash

apt update

apt install docker.io -y

docker run -d \
-p 9200:9200 \
-p 5601:5601 \
-e "discovery.type=single-node" \
docker.elastic.co/elasticsearch/elasticsearch:8.12.0

docker run -d \
--link elasticsearch \
-p 5601:5601 \
docker.elastic.co/kibana/kibana:8.12.0
