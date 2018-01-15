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

# rm -fr /opt/spitfire/notebook
git clone $SPITFIRE_NOTEBOOK_REPO /opt/spitfire/notebook

cat << EOF > /opt/spitfire/notebook/.git/hooks/pre-commit
#!/bin/sh
git add -A
EOF
chmod +x /opt/spitfire/notebook/.git/hooks/pre-commit
cat << EOF > /opt/spitfire/notebook/.git/hooks/post-commit
#!/bin/sh
git push origin master -f -u
EOF
chmod +x /opt/spitfire/notebook/.git/hooks/post-commit

# cp /opt/spitfire/notebook/_conf/* /opt/spitfire/conf/
# sed -i s/INFO/DEBUG/ /opt/spitfire/conf/log4j.properties
# cat /opt/spitfire/conf/users >> /opt/spitfire/conf/shiro.ini

POD_NAME=$HOSTNAME
sed -e "s|SPARK_KUBERNETES_DRIVER_POD_NAME|$POD_NAME|g" /opt/spitfire/notebook/_lib/interpreter.json.template > /tmp/interpreter-tmp.json

RESOURCESTAGINGSERVER_IP=$(kubectl get svc spark-k8s-resource-staging-service -o jsonpath='{.spec.clusterIP}')
sed -e "s|SPARK_KUBERNETES_RESOURCESTAGINGSERVER_URI|$RESOURCESTAGINGSERVER_IP|g" /tmp/interpreter-tmp.json > /opt/spitfire/notebook/_lib/interpreter.json

/opt/spitfire/bin/zeppelin.sh "$@"
