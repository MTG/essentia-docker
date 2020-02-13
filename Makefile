# We build the latest Ubuntu LTS (18.04) and the latest version
# (currently 19.10)
build: ubuntu18.04-python3 ubuntu19.10-python3 buster-python3 latest

ubuntu%:
	docker build --pull --no-cache -f Dockerfile.$@ . -t mtgupf/essentia:$@

buster%:
	docker build --pull --no-cache -f Dockerfile.$@ . -t mtgupf/essentia:$@

latest:
	docker build -f Dockerfile.ubuntu19.04-python3 . -t mtgupf/essentia:latest

push:
	docker push mtgupf/essentia:ubuntu18.04-python3
	docker push mtgupf/essentia:ubuntu19.04-python3
	docker push mtgupf/essentia:stretch-python3
	docker push mtgupf/essentia:latest

