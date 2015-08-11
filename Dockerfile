FROM ubuntu:14.04
MAINTAINER sven@so36.net

RUN apt-get update && apt-get install -y \
    python2.7 \
    python2.7-dev \
    git \
    build-essential \
    python-dev \
    libjpeg-dev \
    libxml2-dev \
    libxslt-dev \
    libz-dev \
    python-virtualenv && \
    mkdir /build && \
    mkdir /data


#VOLUME /src
#ADD requirements.txt /src/requirements.txt
COPY resources/ /build

VOLUME ["/data"]

WORKDIR /build
RUN mkdir downloads

RUN chmod +x create.sh
RUN virtualenv --python=python2.7 . && \
    . bin/activate && \
    pip install -r requirements.txt && \
    ./bin/buildout install makebuildoutcache
#    ./bin/makebuildoutcache
#    python bootstrap-buildout.py --setuptools-version=7.0 --version=2.2.5 && \
#    ./bin/buildout install makebuildoutcache

