# Docker images for Essentia using Python 2

We no longer support Python 2 with Essentia, however if you have a requirement for
it, this Dockerfile can build Essentia on Ubuntu 18.04 (LTS) with Python 2 bindings

To build the image, run

    docker build -f Dockerfile.ubuntu18.04-python2 -t [yourtag] .
    
replacing `[yourtag]` with the name of the tag you want to give the image.
