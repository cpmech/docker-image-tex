#!/bin/bash

NAME="cpmech/tex"

docker logout
docker login
docker push $NAME
