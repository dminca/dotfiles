FROM ubuntu:14.04
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>

# required to run add-apt-repository
RUN apt-get -y dist-upgrade \
    && apt-get install -y software-properties-common

RUN add-apt-repository ppa:duggan/bats --yes \
    && add-apt-repository ppa:git-core/ppa --yes \
    && apt-get update -qq \
    && apt-get install -y bats \
                          git \
                          vim \
                          wget \
                          curl \
                          unzip