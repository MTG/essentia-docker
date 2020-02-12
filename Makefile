# We build the latest Ubuntu LTS (18.04) and the latest version
# (currently 19.04)
build: ubuntu18.04-python2 ubuntu18.04-python3 \
 	   ubuntu19.04-python2 ubuntu19.04-python3 \ 
	   ubuntu18.04-python3-tensorflow ubuntu19.04-python3-tensorflow \ 
	   stretch-python2 stretch-python3 \
	   latest

ubuntu%:
	docker build --no-cache --pull -f Dockerfile.$@ . -t mtgupf/essentia:$@

stretch%:
	docker build --no-cache --pull -f Dockerfile.$@ . -t mtgupf/essentia:$@

latest:
	docker build -f Dockerfile.ubuntu19.04-python3 . -t mtgupf/essentia:latest

push:
	docker push mtgupf/essentia:ubuntu18.04-python2
	docker push mtgupf/essentia:ubuntu18.04-python3
	docker push mtgupf/essentia:ubuntu19.04-python2
	docker push mtgupf/essentia:ubuntu19.04-python3
	docker push mtgupf/essentia:ubuntu18.04-python3-tensorflow
	docker push mtgupf/essentia:ubuntu19.04-python3-tensorflow
	docker push mtgupf/essentia:stretch-python2
	docker push mtgupf/essentia:stretch-python3
	docker push mtgupf/essentia:latest

