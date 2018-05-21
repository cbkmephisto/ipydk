#!/bin/bash

docker build -t geyougua/ipy .

# delete old image
for doi in $(docker images | grep "<none>" | awk '{print $3}')
do
    docker rmi $doi
done
