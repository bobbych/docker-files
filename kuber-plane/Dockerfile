FROM debian:jessie-backports

RUN apt update
RUN apt install -y ca-certificates

RUN mkdir -p /opt/kuber

ADD dist/kuber /opt/kuber
RUN chmod +x /opt/kuber/kuber

ADD _plane /opt/kuber/_plane

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 9091

ENTRYPOINT ["/entrypoint.sh"]
