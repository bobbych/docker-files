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

FROM datalayer/spark-k8s-driver:2.2.0

# Kubectl

ADD dist/kubectl /usr/local/bin
RUN chmod +x /usr/local/bin/kubectl

# Zeppelin Distribution

ADD dist/zeppelin-0.8.0-SNAPSHOT.tar.gz /opt
RUN mv /opt/zeppelin-0.8.0-SNAPSHOT /opt/spitfire

ADD dist/local-repo.tar.gz /opt/spitfire

ADD conf/zeppelin-site.xml /opt/spitfire/conf
ADD conf/interpreter.json.template /opt/spitfire/conf

ADD conf/log4j.properties /opt/spitfire/conf
# RUN sed -i s/INFO/DEBUG/ /opt/spitfire/conf/log4j.properties

ADD conf/shiro.ini /opt/spitfire/conf

RUN rm -fr /opt/spitfire/notebook
COPY notebook /opt/spitfire/notebook

ADD shell/spitfire.sh /opt/spitfire/bin

# Benchmarks

ADD lib/spark-benchmarks-dfsio-0.1.0-with-dependencies.jar /lib

# Hadoop Distribution

ADD dist/hadoop-2.9.0.tar.gz /opt
RUN mv /opt/hadoop-2.9.0 /opt/hadoop
ENV PATH=${PATH}:/opt/hadoop/bin

RUN cp /opt/spitfire/local-repo/2CBEJNFR7/* /opt/hadoop/share/hadoop/hdfs/

# Keytab

RUN mkdir -p /etc/datalayer/conf/keytabs/
COPY keytabs/spnego-localhost.keytab /etc/datalayer/conf/keytabs/spnego-localhost.keytab

# HDFS Locality

ADD lib/pod-cidr-namenode-topology-plugin-0.1-SNAPSHOT-jar-with-dependencies.jar /lib

# Sanity

# RUN find /opt/spitfire -type f -name commons-lang-2*.jar -exec rm  {} \;
# RUN find /opt/spark -type f -name commons-lang-2*.jar -exec rm  {} \;

# 

WORKDIR /opt/spitfire

ENTRYPOINT bin/spitfire.sh
