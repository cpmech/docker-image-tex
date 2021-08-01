#!/bin/bash

set -e

VER_PANDOC=2.14.1
VER_PANDOC_CB=v0.3.12.0b
VER_JULIA_MAJOR=1.6
VER_JULIA=$VER_JULIA_MAJOR.2

# fake sudo function to be used by docker build
sudo () {
  [[ $EUID = 0 ]] || set -- command sudo "$@"
  "$@"
}

# install essential tools
sudo apt-get update -y && \
sudo apt-get install -y --no-install-recommends \
    git \
    librsvg2-bin \
    lmodern \
    python3-pip \
    rsync \
    texlive-fonts-extra \
    texlive-latex-extra \
    texlive-pstricks \
    texlive-science \
    texlive-xetex \
    xz-utils

# install pandoc
curl -L https://github.com/jgm/pandoc/releases/download/$VER_PANDOC/pandoc-$VER_PANDOC-1-amd64.deb -o pandoc.deb
sudo dpkg -i pandoc.deb
rm pandoc.deb

# install pandoc-crossref
curl -L https://github.com/lierdakil/pandoc-crossref/releases/download/$VER_PANDOC_CB/pandoc-crossref-Linux.tar.xz -o pandoc-crossref.tar.xz
tar -xf pandoc-crossref.tar.xz
sudo mv pandoc-crossref /usr/bin/
rm pandoc-crossref.tar.xz
rm pandoc-crossref.1

# install codebraid
sudo pip3 install codebraid

# install julia
curl -L https://julialang-s3.julialang.org/bin/linux/x64/$VER_JULIA_MAJOR/julia-$VER_JULIA-linux-x86_64.tar.gz -o julia.tar.gz
tar -xzf julia.tar.gz
cd $VER_JULIA
sudo mv bin/julia /usr/bin/
sudo mv etc/julia /etc/
sudo mv include/julia /usr/include/
sudo mv lib/* /usr/lib/
sudo mv libexec/7z /usr/bin/
sudo rsync -r share/ /usr/share
cd ..
rm -rf $VER_JULIA
rm julia.tar.gz
