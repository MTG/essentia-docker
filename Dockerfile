FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential libyaml-dev libfftw3-dev libavcodec-dev libavformat-dev libavutil-dev libavresample-dev python-dev libsamplerate0-dev libtag1-dev python-numpy-dev python-numpy python-yaml git


RUN mkdir /essentia
WORKDIR /essentia

RUN git clone https://github.com/MTG/essentia.git

WORKDIR /essentia/essentia

RUN ./waf configure --with-examples --with-python --with-vamp && ./waf && ./waf install

RUN ldconfig
