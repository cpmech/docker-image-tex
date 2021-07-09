#!/bin/bash

NAME="tex"
VERSION="latest"

echo
echo
echo "... docker .................................................."
echo "............................................................."
echo

docker build --no-cache -t cpmech/$NAME:$VERSION .
docker images -q -f "dangling=true" | xargs docker rmi
