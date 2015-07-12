default: build

dotfiles:
	git clone https://github.com/sbuss/dotfiles.git
	cd dotfiles && git checkout more-auto && git pull --rebase

build: dotfiles
	-docker rm screen-volume
	docker create -v /run/screen --name screen-volume busybox /bin/true
	docker build -t dev .

install: build
	rm -f /usr/local/bin/dev
	ln -s `pwd`/dev /usr/local/bin/dev
