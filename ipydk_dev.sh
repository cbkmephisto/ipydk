#!/bin/bash

docker run -it --rm -v `pwd`:/home/ubuntu/work -p 6666:8888 cbkmephisto/ipydk:dev $*

