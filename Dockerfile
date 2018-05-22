FROM ubuntu:18.04

LABEL maintainer="Hailin Su <cbkmephisto@gmail.com>"

# 12 and 4 are user input for answering questions asked by apt-get install tzdata
# 12 is for Country: U.S., 4 is for timezone: central
RUN echo "12" > inp &&\
    echo "4" >> inp &&\
    apt-get update &&\
    apt-get install --no-install-recommends -y \
    sudo \
    python3 python3-pip python3-distutils python3-setuptools \
    python3-wheel ipython3 \
    jupyter-client jupyter-notebook < inp &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* inp &&\
    # less-prev user
    useradd -m -s /bin/bash -p 'ubuntu' ubuntu && \
    adduser ubuntu sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers &&\
    cd /usr/share/javascript && ln -sf ../fonts-font-awesome font-awesome

USER ubuntu

RUN pip3 install numpy pandas scipy sklearn matplotlib seaborn django &&\
    # delete cache for pip
    rm -rf /home/ubuntu/.cache/pip/http/* &&\
    echo "export PATH=${PATH}:/home/ubuntu/bin;\
alias ipython=ipython3;\
alias ll='ls -lF'" >> /home/ubuntu/.bashrc

WORKDIR /home/ubuntu

EXPOSE 8888/tcp 8888/udp

ENV SHELL=/bin/bash 

CMD jupyter notebook --no-browser --ip 0.0.0.0 --port 8888
