# Docker container for RDF-tools
#
# VERSION 0.1

# Pull base image.
FROM dockerfile/ruby

# :)
MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

# Install rdf2json
RUN gem update rdoc && gem install rdf2json

# Install any23
ENV ANY23_VERSION 1.1
RUN \
  cd /tmp && \
  wget http://ftp.jaist.ac.jp/pub/apache/any23/1.1/apache-any23-core-${ANY23_VERSION}.tar.gz && \
  tar xzf apache-any23-core-${ANY23_VERSION}.tar.gz && \
  rm -f apache-any23-core-${ANY23_VERSION}.tar.gz && \
  mv apache-any23-core-${ANY23_VERSION} / && \
  chmod 777 /apache-any23-core-${ANY23_VERSION}/bin && \
  ln -s "/apache-any23-core-${ANY23_VERSION}/bin/any23" "/any23"

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
