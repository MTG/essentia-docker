# We build the latest Ubuntu LTS (20.04) and the latest version
# (currently 21.04)
build: ubuntu20.04-v2.1_beta5 bullseye-v2.1_beta5 latest nightly

ubuntu%:
	docker build --pull  -f Dockerfile.$@ . -t ghcr.io/mtg/essentia:$@

bullseye%:
	docker build --pull -f Dockerfile.$@ . -t ghcr.io/mtg/essentia:$@

latest:
	docker build --pull -f Dockerfile.ubuntu20.04-v2.1_beta5 . -t ghcr.io/mtg/essentia:latest

nightly:
	docker build --pull -f nightly/Dockerfile.ubuntu22.04-nightly . -t ghcr.io/mtg/essentia:nightly

push:
	docker push ghcr.io/mtg/essentia:ubuntu20.04-v2.1_beta5
	docker push ghcr.io/mtg/essentia:bullseye-v2.1_beta5
	docker push ghcr.io/mtg/essentia:latest
	docker push ghcr.io/mtg/essentia:nightly

.PHONY: build latest nightly push
