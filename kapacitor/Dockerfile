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
RUN echo "deb https://repos.influxdata.com/ubuntu trusty stable" > /etc/apt/sources.list.d/kapacitordb.list

RUN apt-get update && apt-get install -yq --no-install-recommends \
    telnet \
    net-tools \
    sudo \
    locales \
    kapacitor \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Setup kapacitordb data directories
RUN mkdir -p /etc/kapacitordb && mkdir -p /data/kapacitor
RUN kapacitord config > /etc/kapacitor/kapacitor.generated.conf
EXPOSE 9092
VOLUME /data/kapacitor
ADD ./etc/kapacitor/kapacitor.conf /etc/kapacitor/kapacitor.conf
WORKDIR /etc/kapacitor

CMD ["/usr/bin/kapacitord", "-config", "/etc/kapacitor/kapacitor.conf"]
