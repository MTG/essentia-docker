# Docker images for Essentia

We provide docker images for the latest version of Essentia, which contain examples (command-line feature extractors), python bindings, vamp plugins and [tensorflow-support](https://mtg.github.io/essentia-labs//news/2019/10/19/tensorflow-models-in-essentia/).

> https://hub.docker.com/r/mtgupf/essentia/

> https://hub.docker.com/r/mtgupf/essentia-nightly/

> https://hub.docker.com/r/mtgupf/essentia-tensorflow/

## Versions

### Latest Essentia release

Images using the following base images are available:

 * ubuntu:18.04 (latest ubuntu LTS)
 * ubuntu:19.10 (latest ubuntu)
 * debian:buster (debian "stable")

The current available tags are:

  * `ubuntu18.04-v2.1_beta5`, `latest` ([Dockerfile.ubuntu18.10-v2.1_beta5](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.ubuntu18.04-v2.1_beta5))
  * `ubuntu19.04-v2.1_beta5` ([Dockerfile.ubuntu19.04-v2.1_beta5](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.ubuntu19.04-v2.1_beta5))
  * `buster-v2.1_beta5` ([Dockerfile.buster-v2.1_beta5](https://github.com/MTG/essentia-docker/blob/master/Dockerfile.buster-v2.1_beta5))

These images are based off the [v2.1_beta5 release]((https://github.com/MTG/essentia/tree/v2.1_beta5)) of the main essentia source tree.


### Git Nightly
For a more up-to-date version of essentia we provide the `mtgupf/essentia-nightly` image. This is updated periodically
based on the most recent commit on the `master` branch of essentia.
We provide the `latest` tag, based on Ubuntu 18.04 LTS:

  *  `latest` ([Dockerfile.ubuntu18.04-nightly](https://github.com/MTG/essentia-docker/blob/master/nightly/Dockerfile.ubuntu18.04-nightly))


### Tensorflow support

The latest essentia have [tensorflow-support](https://mtg.github.io/essentia-labs//news/2019/10/19/tensorflow-models-in-essentia/) in order to easily integrate Machine Learning models into the audio processing and analysis pipelines. More details about this feature can be found [here](https://mtg.github.io/essentia-labs//news/2019/10/19/tensorflow-models-in-essentia/) and [here](https://mtg.github.io/essentia-labs//news/2020/01/16/tensorflow-models-released/).
We provide `mtgupf/essentia-tensorflow` image which contains python3 bindings and examples(command-line feature extractors with tensorflow support). This will based on the most recent commit on the `master` branch of essentia. We provide the `latest` tag based on Ubuntu 18.04 LTS with Tensorflow 1.15.0 

  *  `latest` ([Dockerfile.ubuntu18.04-tensorflow-v1.15.0](https://github.com/MTG/essentia-docker/blob/master/tensorflow/Dockerfile.ubuntu18.04-tensorflow-v1.15.0))


### Python 2
We no longer officially support Python 2, however we include a Dockerfile to build Essentia with Python 2 on Ubuntu 18.04 LTS in the `python2` directory. 


## Usage examples

### Music extractor
Analyze a file `audio.wav` located in the current directory and write results to the same directory:

    docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia essentia_streaming_extractor_music audio.wav audio.sig


### Essentia in python
Run a python script using Essentia located in the current directory:

    docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia python3 test.py

## Image management

You can rebuild an image and tag it locally using Make:

    make <tag>
    make ubuntu18.04-python3
    make build # to build all images
    make push # to push all images
