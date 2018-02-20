#!/usr/bin/env bash

# Licensed to Datalayer (http://datalayer.io) under one or more
# contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. Datalayer licenses this file
# to you under the Apache License, Version 2.0 (the 
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

rm -fr _ui
cd /dla/ui
yarn build:dist

cd /dla/kuber
./build.sh

cd /dla/docker-files/kuber
cp -r /dla/ui/_ui .
cp /dla/kuber/kuber ./dist

docker build \
  -t datalayer/explorer:0.0.1 \
  .

docker push datalayer/explorer:0.0.1

# docker run --network host --name kuber-test -it --rm -e APISERVER_HOST=http://localhost:8001 -e KUBER_INSECURE_BIND_ADDRESS=0.0.0.0 datalayer/explorer:latest
