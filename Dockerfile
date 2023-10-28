FROM ubuntu:20.04
FROM python:3.10.6

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        bash \
        build-essential \
        cmake \
        git \
        ssh \
	make \
	protobuf-compiler \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-flask \
        python3-tk \
        python3-opencv \
        wget \
        tmux \
        htop \
        vim  \
        unzip

WORKDIR /app
COPY . /app

RUN python3 -m pip install --upgrade pip
RUN pip3 install  --no-warn-script-location -r requirements.txt
