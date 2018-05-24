#!/bin/bash

. param.rc

docker run -it --rm -v `pwd`:/home/ubuntu/work -p 8888:8888 cbkmephisto/ipydk:$tag bash

