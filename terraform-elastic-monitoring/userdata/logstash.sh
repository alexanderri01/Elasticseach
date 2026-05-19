#!/bin/bash

apt update
apt install docker.io -y

docker run -d -p 5044:5044 \
docker.elastic.co/logstash/logstash:8.12.0
