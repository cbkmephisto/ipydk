#!/bin/bash

path=$(dirname "$0")

. $path/param.rc $*

docker run -it --rm -v `pwd`:/home/ubuntu/work cbkmephisto/ipydk:$tag ipython3
