# Docker images for Essentia

We provide docker images for the latest version of Essentia, which contains
 examples (command-line feature extractors), python bindings and vamp plugins.


> https://hub.docker.com/r/mtgupf/essentia/


## Versions

Images using the following base images are available:

 * ubuntu:16.04 (latest ubuntu LTS)
 * ubuntu:17.10 (latest ubuntu)
 * debian:stretch (debian "stable")

We also provide two variations of the essentia image, one with bindings for python2, and one for python3.
Therefore, the current available tags are:

  * `ubuntu16.04-python2` ([Dockerfile.ubuntu16.10-python2](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.ubuntu16.04-python2))
  * `ubuntu16.04-python3`, `latest` ([Dockerfile.ubuntu16.10-python3](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.ubuntu16.04-python3))
  * `ubuntu17.10-python2` ([Dockerfile.ubuntu17.10-python2](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.ubuntu17.10-python2))
  * `ubuntu17.10-python3` ([Dockerfile.ubuntu17.10-python3](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.ubuntu17.10-python3))
  * `stretch-python2` ([Dockerfile.stretch-python2](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.stretch-python2))
  * `stretch-python3` ([Dockerfile.stretch-python3](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.stretch-python3))

Images are currently based off the HEAD of the [main essentia source tree](https://github.com/MTG/essentia) , and are updated from time to time.

## Usage examples

### Music extractor
Analyze a file `audio.wav` located in the current directory and write results to the same directory:

    docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia essentia_streaming_extractor_music audio.wav audio.sig


### Essentia in python
Run a python script using Essentia located in the current directory:

    docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia python test.py

## Image management

You can rebuild an image and tag it locally using Make:

    make <tag>
    make ubuntu16.04-python2
    make all # to build all images
    make push <tag>
    make push all # to push all images
