#!/bin/bash

dir=$(cd `dirname $0`; pwd)

docker run --name luv -it --rm \
-v $dir:/opt/dev \
-w /opt/dev \
luv-dev:latest