#!/bin/bash

path=$(dirname "$0")

. $path/param.rc $*

docker run -it --rm -p 8888:8888 -v `pwd`:/home/ubuntu/work cbkmephisto/ipydk:$tag

