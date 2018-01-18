
FROM python:2.7
MAINTAINER Olivier Fortin <olivier@fanslab.com>

RUN apt-get update && \
        apt-get install -y \
        build-essential \
        cmake \
        libgtk2.0-dev \
        pkg-config \
        python-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        git \
        unzip


RUN pip install numpy

WORKDIR /
RUN wget https://github.com/opencv/opencv/archive/2.4.13.5.zip \
&& unzip 2.4.13.5.zip \
&& cd opencv-2.4.13.5 \
&& mkdir build \
&& cd build \
&& cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_NEW_PYTHON_SUPPORT=ON ..\
&& make \
&& make install \
&& rm /2.4.13.5.zip  \
&& rm -r /opencv-2.4.13.5
