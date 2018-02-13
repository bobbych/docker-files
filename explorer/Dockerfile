FROM debian:jessie-backports

RUN apt update
RUN apt install -y ca-certificates

RUN mkdir -p /opt/kuber

ADD dist/kuber /opt/kuber
RUN chmod +x /opt/kuber/kuber

ADD _ui /opt/kuber/_ui

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
