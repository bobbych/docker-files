#!/bin/bash

cd /opt/kuber

./kuber \
  server \
  --apiserver-host=$APISERVER_HOST \
  --microsoft-application-id=$AZURE_APPLICATION_ID \
  --microsoft-redirect=$AZURE_REDIRECT \
  --microsoft-scope=$AZURE_SCOPE \
  --hdfs=$HDFS \
  --insecure-bind-address=$KUBER_INSECURE_BIND_ADDRESS \
  --kuber-plane=$KUBER_PLANE \
  --kuber-rest=$KUBER_REST \
  --kuber-ws=$KUBER_WS \
  --spitfire-rest=$SPITFIRE_REST \
  --spitfire-ws=$SPITFIRE_WS \
  --twitter-redirect=$TWITTER_REDIRECT
