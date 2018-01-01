#!/bin/bash

/opt/kuber/kuber \
  server \
  --apiserver-host=$APISERVER_HOST \
  --kuber-rest=$KUBER_REST \
  --kuber-ws=$KUBER_WS \
  --azure-application-id=$AZURE_APPLICATION_ID \
  --azure-redirect=$AZURE_REDIRECT \
  --azure-scope=$AZURE_SCOPE \
  --spitfire-rest=$SPITFIRE_REST \
  --spitfire-ws=$SPITFIRE_WS \
  --hdfs=$HDFS \
  --twitter-redirect=$TWITTER_REDIRECT \
  --kuber-plane=$KUBER_PLANE
