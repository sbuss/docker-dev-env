default: build

build:
	docker build -t dev .

install: build
	ln -s `pwd`/dev /usr/local/bin/dev
