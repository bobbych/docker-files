#!/bin/sh

docker build -t datalayer/hdfs-k8s-locality-nn:2.9.0 .
docker push datalayer/hdfs-k8s-locality-nn:2.9.0
