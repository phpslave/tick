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
    chronograf \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN mkdir -p /etc/chronograf && mkdir -p /data/chronograf
RUN ln -s /opt/chronograf/chronograf /usr/bin/chronograf
RUN chronograf -sample-config > /etc/chronograf/chronograf.generated.conf

ADD ./etc/chronograf/chronograf.conf /etc/chronograf/chronograf.conf
VOLUME /data/chronograf
WORKDIR /etc/chronograf
EXPOSE 10000

CMD ["/usr/bin/chronograf", "-config", "/etc/chronograf/chronograf.conf"]
