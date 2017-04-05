FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential libyaml-dev libfftw3-dev libavcodec-dev libavformat-dev libavutil-dev libavresample-dev python-dev libsamplerate0-dev libtag1-dev python-numpy-dev python-numpy python-yaml git


RUN mkdir /essentia
WORKDIR /essentia

RUN git clone https://github.com/MTG/essentia.git

WORKDIR /essentia/essentia

RUN ./waf configure --with-examples --with-python --with-vamp && ./waf && ./waf install

RUN ldconfig

WORKDIR /
RUN rm -Rf /essentia

RUN apt-get remove -y build-essential libyaml-dev libfftw3-dev libavcodec-dev libavformat-dev libavutil-dev libavresample-dev python-dev libsamplerate0-dev libtag1-dev python-numpy-dev

RUN apt-get autoremove -y
RUN apt-get clean autoclean -y

RUN apt-get install -y libyaml-0-2 libfftw3-3 libtag1v5 libsamplerate0 libavcodec-ffmpeg56 libavformat-ffmpeg56 libavutil-ffmpeg54 libavresample-ffmpeg2 python python-numpy libpython2.7
