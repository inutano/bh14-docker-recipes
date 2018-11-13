# Docker container for Apache Jena
#
# VERSION 0.2.0

# Pull base image.
FROM java:8

# :)
MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

# Specify the version of Jena.
ENV JENA_VERSION 3.9.0

# Install Jena.
RUN \
  cd /tmp && \
  wget http://ftp.tsukuba.wide.ad.jp/software/apache/jena/binaries/apache-jena-${JENA_VERSION}.tar.gz && \
  tar xvf apache-jena-${JENA_VERSION}.tar.gz && \
  rm -f apache-jena-${JENA_VERSION}.tar.gz && \
  mv apache-jena-${JENA_VERSION} /

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
