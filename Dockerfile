FROM ubuntu:18.04

LABEL maintainer="Hailin Su <cbkmephisto@gmail.com>"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# 12 and 4 are user input for answering questions asked by apt-get install
# 12 is for Country: U.S., 4 is for timezone: central
RUN echo "12" > inp &&\
    echo "4" >> inp &&\
    apt-get update
RUN apt-get install --no-install-recommends -y \
	sudo \
    python3 python3-pip python3-distutils python3-setuptools \
    python3-wheel ipython3 \
    jupyter-client jupyter-notebook < inp
RUN rm -rf /var/lib/apt/lists/* inp

# less-prev user
RUN useradd -m -s /bin/bash -p 'ubuntu' ubuntu && \
    adduser ubuntu sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu

RUN pip3 install numpy pandas scipy sklearn matplotlib seaborn
RUN pip3 install django

# delete cache for pip
RUN rm -rf /home/ubuntu/.cache/pip/http/*

WORKDIR /home/ubuntu

RUN echo "export PATH=${PATH}:/home/ubuntu/bin;\
alias ipython=ipython3;\
alias ll='ls -lF'" >> /home/ubuntu/.bashrc

EXPOSE 8888/tcp
EXPOSE 8888/udp

CMD jupyter notebook --no-browser --ip 0.0.0.0 --port 8888

RUN echo '\n\ndocker run -it --rm -p 8888:8888 geyougua/ipydk:latest\n\n'
