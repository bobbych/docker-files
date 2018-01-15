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

docker build \
  -t datalayer/spitfire:0.0.1 \
  --squash \
  --compress \
  .

docker push datalayer/spitfire:0.0.1

# docker run --network host --name spitfire-local -v /root/.kube:/home/datalayer/.kube -it --rm --env APISERVER_HOST=http://localhost:8001 --env SPITFIRE_NOTEBOOK_REPO=https://github.com/datalayer/notebook-init.git --env ZEPPELIN_CONF_DIR=/opt/spitfire/notebook/_lib datalayer/spitfire:0.0.1
