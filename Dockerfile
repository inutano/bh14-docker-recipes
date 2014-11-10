# installing DBs for the benchmark at #biohack14
#
# VERSION 0.1

FROM ubuntu:trusty

MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

# Initialize source directory
RUN mkdir ~/src

# Install essential tools
RUN apt-get -qq update && apt-get install --no-install-recommends -y vim git tmux openjdk-7-jre wget

# Install and configures of Elasticsearch
# Download and unpack Elasticsearch, then install Marvel for management/monitoring

RUN export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV ELASTICSEARCH_VERSION=1.4.0

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz &&\
    tar xzf elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz &&\
    cd elasticsearch-${ELASTICSEARCH_VERSION} &&\
    ./bin/plugin -i elasticsearch/marvel/latest

# Start Elasticsearch
RUN ./bin/elasticsearch
