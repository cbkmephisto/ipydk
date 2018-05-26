#!/bin/bash

path=$(dirname "$0")

. $path/param.rc $*

docker run -it --rm -v `pwd`:/home/ubuntu/work -p 8888:8888 cbkmephisto/ipydk:$tag bash
