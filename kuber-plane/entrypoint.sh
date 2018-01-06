#!/bin/bash

cd /opt/kuber

./kuber \
  server \
  --apiserver-host=$APISERVER_HOST \
  --hdfs=$HDFS \
  --insecure-bind-address=$KUBER_INSECURE_BIND_ADDRESS \
  --kuber-plane=$KUBER_PLANE \
  --kuber-rest=$KUBER_REST \
  --kuber-ws=$KUBER_WS \
  --microsoft-application-id=$MICROSOFT_APPLICATION_ID \
  --microsoft-redirect=$MICROSOFT_REDIRECT \
  --microsoft-secret=$MICROSOFT_SECRET \
  --microsoft-scope=$MICROSOFT_SCOPE \
  --spitfire-rest=$SPITFIRE_REST \
  --spitfire-ws=$SPITFIRE_WS \
  --twitter-redirect=$TWITTER_REDIRECT
