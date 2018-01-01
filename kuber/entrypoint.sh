#!/bin/bash

/opt/kuber/kuber \
  server \
  --apiserver-host=$APISERVER_HOST \
  --azure-application-id=$AZURE_APPLICATION_ID \
  --azure-redirect=$AZURE_REDIRECT \
  --azure-scope=$AZURE_SCOPE \
  --hdfs=$HDFS \
  --insecure-bind-address=$KUBER_INSECURE_BIND_ADDRESS \
  --kuber-plane=$KUBER_PLANE \
  --kuber-rest=$KUBER_REST \
  --kuber-ws=$KUBER_WS \
  --spitfire-rest=$SPITFIRE_REST \
  --spitfire-ws=$SPITFIRE_WS \
  --twitter-redirect=$TWITTER_REDIRECT
