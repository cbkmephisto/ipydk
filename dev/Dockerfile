FROM cbkmephisto/ipydk:latest

# dev image
# add build-essential
# add python3-dev

LABEL maintainer="Hailin Su <cbkmephisto@gmail.com>"

USER root

RUN apt-get update &&\
    apt-get install --no-install-recommends -y \
    build-essential python3-dev &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

USER ubuntu

