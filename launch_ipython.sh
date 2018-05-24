#!/bin/bash

. param.rc $*

docker run -it --rm -v `pwd`:/home/ubuntu/work cbkmephisto/ipydk:$tag ipython3

