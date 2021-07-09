#!/bin/bash

set -e

# fake sudo function to be used by docker build
sudo () {
  [[ $EUID = 0 ]] || set -- command sudo "$@"
  "$@"
}

# arguments
INTEL=${1:-"OFF"}
MPI=${2:-"OFF"}

# install essential tools
sudo apt-get update -y && \
sudo apt-get install -y --no-install-recommends \
    git \
    texlive-fonts-extra
    texlive-latex-extra
    texlive-pstricks
    texlive-science
