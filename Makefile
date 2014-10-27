all: build push

build:
	docker build -t cydev/nginx-backend .
push:
	docker push cydev/nginx-backend