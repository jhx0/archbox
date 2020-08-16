.PHONY: build run

build:
	docker build -t archbox:1.0 .

run:
	docker run \
		-h archbox \
		--detach \
		-p 6001:22 \
		-p 6002:5900 \
		archbox:1.0 \

shell:
	docker exec -it archbox:1.0 bash
