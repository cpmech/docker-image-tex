#!/bin/bash

set -e

# fake sudo function to be used by docker build
sudo () {
  [[ $EUID = 0 ]] || set -- command sudo "$@"
  "$@"
}

# install essential tools
sudo apt-get update -y && \
sudo apt-get install -y --no-install-recommends \
    git \
    texlive-fonts-extra \
    texlive-latex-extra \
    texlive-pstricks \
    texlive-science \
    librsvg2-bin \
    python3-pip

# install pandoc
curl -L https://github.com/jgm/pandoc/releases/download/2.14.1/pandoc-2.14.1-1-amd64.deb --output pandoc.deb
dpkg -i pandoc.deb

# install pandoc-crossref
curl -L https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.12.0b/pandoc-crossref-Linux.tar.xz --output pandoc-crossref.tar.xz
tar -xf pandoc-crossref.tar.xz
mv pandoc-crossref /usr/bin/

# install codebraid
pip3 install codebraid
