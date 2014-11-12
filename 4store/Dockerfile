# Docker container for 4store
#
# VERSION 0.1

# Pull base image.
FROM dockerfile/ubuntu

# :)
MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

# Install packages.
RUN apt-get update && \
    apt-get install -y automake gperf libtool flex bison \
            libssl-dev libraptor2-0 librasqal3 libraptor2-dev \
            librasqal3-dev ncurses-base libncurses5 \
            libncurses5-dev libreadline6-dev uuid-dev libglib2.0-dev && \
    rm -rf /var/lib/apt/lists/*

# Install 4store
RUN \
  cd /tmp && \
  git clone https://github.com/garlik/4store.git && \
  cd 4store && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install && \
  4s-backend-setup default && \
  4s-backend default

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
