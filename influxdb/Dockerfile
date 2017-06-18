FROM ubuntu:14.04

USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    wget \
    curl \
    bzip2 \
    ca-certificates \
    apt-transport-https

RUN curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
RUN echo "deb https://repos.influxdata.com/ubuntu trusty stable" > /etc/apt/sources.list.d/influxdb.list

RUN apt-get update && apt-get install -yq --no-install-recommends \
    telnet \
    net-tools \
    sudo \
    locales \
    influxdb \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Setup influxdb data directories
RUN mkdir -p /data/influx/data && \
    mkdir -p /data/influx/meta && \
    mkdir -p /data/influx/wal && \
    mkdir -p /etc/influxdb
RUN influxd config > /etc/influxdb/influxdb.generated.conf

ADD ./etc/influxdb/influxdb.conf /etc/influxdb/influxdb.conf
WORKDIR /etc/influxdb
EXPOSE 8083
EXPOSE 8086
EXPOSE 8088
VOLUME /data/influx/data
VOLUME /data/influx/meta
VOLUME /data/influx/wal

CMD ["/usr/bin/influxd", "-config", "/etc/influxdb/influxdb.conf"]
