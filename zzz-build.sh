#!/bin/bash

set -ue

. param.rc $*

docker build -t cbkmephisto/ipydk:$tag $tag

# delete old unused image(s)
for doi in $(docker images | grep "<none>" | awk '{print $3}')
do
    docker rmi $doi
done

