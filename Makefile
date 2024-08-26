get-wrk:
	git clone https://github.com/khulnasoft/wrk2.git

docker-build-base:
	docker image prune -f
	DOCKER_BUILDKIT=1 docker build -t wrk2 -f Dockerfile.wrk2 --no-cache wrk2

docker-run:
	docker rm -f gowrk2 || true
	docker volume prune -f
	docker run --rm --name gowrk2 -it -v `pwd`:/github.com/khulnasoft/gowrk2 --workdir=/github.com/khulnasoft/gowrk2 -e WRK_LOCATION=wrk wrk2 go run main.go
