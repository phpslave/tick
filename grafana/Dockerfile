FROM ubuntu:14.04

USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    wget \
    curl \
    bzip2 \
    ca-certificates \
    apt-transport-https

RUN curl https://packagecloud.io/gpg.key | sudo apt-key add -
RUN echo "deb https://packagecloud.io/grafana/stable/debian/ jessie main" > /etc/apt/sources.list.d/grafana.list
RUN mkdir -p /etc/grafana && mkdir -p /data/grafana
RUN apt-get update && apt-get install -yq --no-install-recommends \
    telnet \
    net-tools \
    sudo \
    locales \
    grafana \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD ./etc/grafana/grafana.ini /etc/grafana/grafana.ini
VOLUME /var/lib/grafana
WORKDIR /usr/share/grafana
EXPOSE 3000

CMD ["service", "grafana-server", "start"]