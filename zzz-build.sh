#!/bin/bash

set -ue

tag="latest"

if [ $# -gt 0 ]; then
    if [ $1 == "dev" ]; then
        tag="dev"
    fi
fi

docker build -t cbkmephisto/ipydk:$tag $tag

# delete old unused image(s)
for doi in $(docker images | grep "<none>" | awk '{print $3}')
do
    docker rmi $doi
done

