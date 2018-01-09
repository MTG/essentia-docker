build: ubuntu16.04-python2 ubuntu16.04-python3 ubuntu17.10-python2 ubuntu17.10-python2 stretch-python2 stretch-python3

ubuntu%:
	docker build -f Dockerfile.$@ . -t mtgupf/essentia:$@

stretch%:
	docker build -f Dockerfile.$@ . -t mtgupf/essentia:$@

push:
	docker push mtgupf/essentia:ubuntu16.04-python2
	docker push mtgupf/essentia:ubuntu16.04-python3
	docker push mtgupf/essentia:ubuntu17.10-python2
	docker push mtgupf/essentia:ubuntu17.10-python2
	docker push mtgupf/essentia:stretch-python2
	docker push mtgupf/essentia:stretch-python3

