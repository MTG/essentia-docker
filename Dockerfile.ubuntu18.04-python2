FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y libyaml-0-2 libfftw3-3 libtag1v5 libsamplerate0 \
       libavcodec57 libavformat57 libavutil55 libavresample3 \
       python python-numpy libpython2.7 python-numpy python-yaml python-six \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y build-essential libyaml-dev libfftw3-dev \
       libavcodec-dev libavformat-dev libavutil-dev libavresample-dev \
       python-dev libsamplerate0-dev libtag1-dev python-numpy-dev git \
    && mkdir /essentia && cd /essentia && git clone https://github.com/MTG/essentia.git \
    && cd /essentia/essentia && ./waf configure --with-examples --with-python --with-vamp \
    && ./waf && ./waf install && ldconfig \
    &&  apt-get remove -y build-essential libyaml-dev libfftw3-dev libavcodec-dev \
        libavformat-dev libavutil-dev libavresample-dev python-dev libsamplerate0-dev \
        libtag1-dev python-numpy-dev \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && cd / && rm -rf /essentia/essentia

WORKDIR /essentia
