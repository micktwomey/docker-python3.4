# Base python 3.4 build, inspired by
# https://github.com/crosbymichael/python-docker/blob/master/Dockerfile
FROM ubuntu:14.04
MAINTAINER Michael Twomey, mick@twomeylee.name

RUN echo "deb http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu trusty main" > /etc/apt/sources.list.d/deadsnakes.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DB82666C

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    mercurial \
    python3.4 \
    python3.4-dev \
    ssh \
    && apt-get autoremove \
    && apt-get clean

ADD https://github.com/pypa/pip/raw/645180e2714b4ffcf40363a608239e089c9dafab/contrib/get-pip.py /root/get-pip.py
RUN python3.4 /root/get-pip.py
RUN pip3.4 install -U "setuptools==3.5.1"
RUN pip3.4 install -U "pip==1.5.5"
RUN pip3.4 install -U "virtualenv==1.11.5"

CMD []
ENTRYPOINT ["/usr/bin/python3.4"]
