VERSION=1.1

SSH_PORT=6001
VNC_PORT=6002

.PHONY: build run

build:
	docker build -t archbox:$(VERSION) .

run:
	docker run \
		-h archbox \
		--detach \
		-p $(SSH_PORT):22 \
		-p $(VNC_PORT):5900 \
		archbox:$(VERSION) \
