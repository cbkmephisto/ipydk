FROM ubuntu:18.04

LABEL maintainer="Hailin Su <cbkmephisto@gmail.com>"
LABEL version="2019-02-18"

# 2019-02-18 add jupyter lab extension

# 12 and 4 are user input for answering questions asked by apt-get install tzdata
# 12 is for Country: U.S., 4 is for timezone: central
RUN echo "12" > inp &&\
    echo "4" >> inp &&\
    apt-get update &&\
    apt-get upgrade -y &&\
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
    cd /usr/share/javascript && ln -sf ../fonts-font-awesome font-awesome &&\
	cd /usr/bin && ln -sf ipython3 ipython

USER ubuntu

RUN pip3 install --force-reinstall --no-cache-dir tornado numpy pandas scipy sklearn matplotlib seaborn django bokeh bs4 jupyterlab &&\
    # delete cache for pip
    rm -rf /home/ubuntu/.cache/pip/http/* &&\
    # If you are using a version of Jupyter Notebook earlier than 5.3, then you must also run the following command to enable the JupyterLab server extension:
    sudo jupyter serverextension enable --py jupyterlab --sys-prefix &&\
    echo "export PATH=${PATH}:/home/ubuntu/bin;\
	alias ipython=ipython3;\
	alias ipydk='cd && jupyter notebook --ip 0.0.0.0 --port 8888';\
	alias ll='ls -lF'" >> /home/ubuntu/.bashrc;\
	[ ! -d /home/ubuntu/.ipython/profile_default/startup ] && mkdir -p /home/ubuntu/.ipython/profile_default/startup;\
	echo "import numpy as np" >> /home/ubuntu/.ipython/profile_default/startup/n-numpy.py

WORKDIR /home/ubuntu/work

EXPOSE 8888/tcp 8888/udp

ENV SHELL=/bin/bash 

CMD jupyter notebook --no-browser --ip 0.0.0.0 --port 8888
