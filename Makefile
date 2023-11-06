VERSION ?= develop

all: mrr

mrr: mrr.c
	gcc -Wall -Werror -g -pthread $< -o $@

clean:
	rm -f *.o mrr

docker:
	- docker buildx create --name project-v3-builder
	docker buildx use project-v3-builder
	- docker buildx build --push --platform=linux/arm64,linux/amd64 --tag jam2in/mrr:${VERSION} --progress tty .
	- docker buildx rm project-v3-builder
