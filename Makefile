default: build

dotfiles:
	git clone https://github.com/sbuss/dotfiles.git
	cd dotfiles && git checkout more-auto && git pull --rebase

build: dotfiles
	docker build -t dev .

install: build
	ln -s `pwd`/dev /usr/local/bin/dev
