# We build the latest Ubuntu LTS (20.04) and the latest version
# (currently 21.04)
build: ubuntu21.04-v2.1_beta5 ubuntu21.04-v2.1_beta5 bullseye-v2.1_beta5 latest nightly

ubuntu%:
	docker build --pull  -f Dockerfile.$@ . -t mtgupf/essentia:$@

bullseye%:
	docker build --pull -f Dockerfile.$@ . -t mtgupf/essentia:$@

latest:
	docker build --pull -f Dockerfile.ubuntu20.04-v2.1_beta5 . -t mtgupf/essentia:latest

nightly:
	docker build --pull -f nightly/Dockerfile.ubuntu20.04-nightly . -t mtgupf/essentia-nightly:latest

tensorflow:
	docker build --pull -f tensorflow/Dockerfile.ubuntu18.04-tensorflow-v1.15.0 . -t mtgupf/essentia-tensorflow:latest

push:
	docker push mtgupf/essentia:ubuntu20.04-v2.1_beta5
	docker push mtgupf/essentia:ubuntu21.04-v2.1_beta5
	docker push mtgupf/essentia:bullseye-v2.1_beta5
	docker push mtgupf/essentia:latest
	docker push mtgupf/essentia-nightly:latest

.PHONY: build latest nightly tensorflow push
