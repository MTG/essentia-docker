FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y libyaml-0-2 libfftw3-3 libtag1v5 libsamplerate0 \
       libavcodec-ffmpeg56 libavformat-ffmpeg56 libavutil-ffmpeg54 \
       libavresample-ffmpeg2 python python-numpy libpython2.7 python-numpy python-yaml \
    && apt-get install -y build-essential libyaml-dev libfftw3-dev \
       libavcodec-dev libavformat-dev libavutil-dev libavresample-dev \
       python-dev libsamplerate0-dev libtag1-dev python-numpy-dev git

RUN mkdir /essentia
WORKDIR /essentia

RUN git clone https://github.com/MTG/essentia.git

WORKDIR /essentia/essentia

RUN ./waf configure --with-examples --with-python --with-vamp \
    && ./waf \
    && ./waf install \
    && ldconfig

RUN apt-get remove -y build-essential libyaml-dev libfftw3-dev libavcodec-dev \
    libavformat-dev libavutil-dev libavresample-dev python-dev libsamplerate0-dev \
    libtag1-dev python-numpy-dev \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /essentia
RUN rm -rf /essentia/essentia
