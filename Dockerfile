FROM ubuntu:20.04

# essential tools
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt-get update -y && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  gnupg \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# copy files
COPY . /tmp/tex-docker
WORKDIR /tmp/tex-docker

# install dependencies
RUN bash zscripts/install-deps.bash \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# configure image for remote development
RUN bash zscripts/common-debian.sh

# compile examples
RUN bash all.bash
