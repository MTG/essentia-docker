# Dockerfile for Essentia (Ubuntu 16.04)

Configured with examples (command-line feature extractors), python bindings and vamp plugin.

Image downloads: https://hub.docker.com/r/mtgupf/essentia/


## Usage examples

### Music extractor
Analyze a file ```audio.wav``` located in the current directory and write results to the same directory:
```
docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia essentia_streaming_extractor_music audio.wav audio.sig
```

### Freesound extractor
The same, but using Freesound extractor:
```
docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia essentia_streaming_extractor_freesound audio.wav audio.sig
```

### Essentia in python
Run a python script using Essentia located in the current directory:
```
docker run -ti --rm -v `pwd`:/essentia mtgupf/essentia python test.py
```
