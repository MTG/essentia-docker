# We build the latest Ubuntu LTS (18.04) and the latest version
# (currently 19.10)
build: ubuntu18.04-v2.1_beta5 ubuntu19.10-v2.1_beta5 buster-v2.1_beta5 latest nightly

ubuntu%:
	docker build --pull  -f Dockerfile.$@ . -t mtgupf/essentia:$@

buster%:
	docker build --pull -f Dockerfile.$@ . -t mtgupf/essentia:$@

latest:
	docker build --pull -f Dockerfile.ubuntu18.04-v2.1_beta5 . -t mtgupf/essentia:latest

nightly:
	docker build --pull -f nightly/Dockerfile.ubuntu18.04-nightly . -t mtgupf/essentia-nightly:latest
	docker build --pull -f nightly/Dockerfile.ubuntu18.04-tensorflow-nightly . -t mtgupf/essentia-nightly:ubuntu18.04-tensorflow
	docker build --pull -f nightly/Dockerfile.ubuntu19.04-tensorflow-nightly . -t mtgupf/essentia-nightly:ubuntu19.04-tensorflow


push:
	docker push mtgupf/essentia:ubuntu18.04-v2.1_beta5
	docker push mtgupf/essentia:ubuntu19.10-v2.1_beta5
	docker push mtgupf/essentia:buster-v2.1_beta5
	docker push mtgupf/essentia:latest
	docker push mtgupf/essentia-nightly:latest
	docker push mtgupf/essentia-nightly:ubuntu18.04-tensorflow
	docker push mtgupf/essentia-nightly:ubuntu19.04-tensorflow

.PHONY: build latest nightly push