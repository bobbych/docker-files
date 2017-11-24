#!/bin/sh

docker build -t datalayer/hdfs-k8s-locality-nn:2.7.3 .
docker push  datalayer/hdfs-k8s-locality-nn:2.7.3
