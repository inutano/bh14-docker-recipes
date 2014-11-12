# installing DBs for the benchmark at #biohack14
#
# VERSION 0.1

FROM ubuntu:14.04.1

MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

## Initialize section

## Source directory
WORKDIR ~
ENV SRC_BASE src
RUN mkdir ${SRC_BASE}

## Install packages via apt-get
RUN apt-get -qq update && \
    apt-get install -y vim git tmux openjdk-7-jre wget codeblocks emacs23-nox automake clang cmake

## Install section

#
# Install and configures Elasticsearch
#

WORKDIR ~/${SRC_BASE}
RUN export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV ELASTICSEARCH_VERSION 1.4.0

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz && \
    tar xzf elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz
WORKDIR elasticsearch-${ELASTICSEARCH_VERSION}
RUN ./bin/plugin -i elasticsearch/marvel/latest

# Install and configures 4store
# Get 4store and build it

RUN cd ~/${SRC_BASE}
RUN apt-get install -y git build-essential automake gperf libtool flex && \
    bison libssl-dev libraptor2-0 librasqal3 libraptor2-dev librasqal3-dev && \
    ncurses-base lib64ncurses5 lib64ncurses5-dev libreadline6-dev uuid-dev libglib2.0-dev

RUN git clone https://github.com/garlik/4store.git
RUN cd 4store && \
    ./autogen.sh && ./configure && make && make install

# Install Apache Jena
RUN export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV JENA_VERSION=2.12.1

RUN apt-get install -y wget
RUN wget http://ftp.tsukuba.wide.ad.jp/software/apache//jena/binaries/apache-jena-${JENA_VERSION}.tar.gz
RUN tar xzf apache-jena-${JENA_VERSION}.tar.gz
RUN cd apache-jena-${JENA_VERSION}

# Install RDF Tools

ENV INSTALL_RDF_DIR=/usr/local/bin
ENV ANY23_VERSION=1.1

RUN gem install rdf2json

RUN cd ~/${SRC_BASE}
RUN wget http://ftp.jaist.ac.jp/pub/apache/any23/1.1/apache-any23-core-${ANY23_VERSION}.tar.gz
RUN tar xzf apache-any23-core-${ANY23_VERSION}.tar.gz
RUN cd apache-any23-core-${ANY23_VERSION}
RUN chmod 777 bin
RUN ln -s "`pwd`/bin/any23" "$INSTALL_DIR/any23"

# Install Virtuoso

ENV VIRTUOSO_VERSION=develop/7
RUN cd ~/${SRC_BASE}

RUN apt-get install -y git build-essential automake gperf libtool flex bison libssl-dev

RUN git clone https://github.com/openlink/virtuoso-opensource.git
RUN cd virtuoso-opensource
RUN git checkout $VIRTUOSO_VERSION
RUN ./autogen.sh
RUN export CFLAGS="-O2 -m64"
RUN ./configure
RUN make
RUN make install

# Install Hadoop

# Proxy settings -- leave empty if no proxy is needed:
#
# Example: PROXY_HTTP=http://proxy.yourcompany.com:8080
ENV PROXY_HTTP=
ENV PROXY_HTTPS=$PROXY_HTTP

# Default Java home -- if JAVA_VERSION is set below, then that
# particular JRE will be installed and JAVA_HOME will be overwritten:
RUN export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

# If JAVA_VERSION is set, then that particular JRE will be installed
# and JAVA_HOME will be reset to that installation.
ENV PROTOBUF_VERSION=2.5.0
ENV HADOOP_VERSION=2.5.1
# For example: JAVA_VERSION=java-7-oracle
ENV JAVA_VERSION=

# Set proxy environment variables -- if necessary:
if [[ "" != "$PROXY_HTTP" ]] ; then
    PROXY_ENV="http_proxy=$PROXY_HTTP"
        PROXY_ENVS="http_proxy=$PROXY_HTTPS"
        else
            PROXY_ENV=
                PROXY_ENVS=
                fi


## START SECTION

# Setting up 4store and starting it
RUN cd ~/${SRC_BASE}/4store
RUN 4s-backend-setup default
RUN 4s-backend default

# Start Elasticsearch
RUN cd ~/${SRC_BASE}/elasticsearch-${ELASTICSEARCH_VERSION}
RUN ./bin/elasticsearch

# Start Virtuoso
# sleep 30; firefox http://127.0.0.1:8890
RUN cd /usr/local/virtuoso-opensource/var/lib/virtuoso
RUN chown -R `whoami` db
RUN cd db
RUN /usr/local/virtuoso-opensource/bin/virtuoso-t +foreground
