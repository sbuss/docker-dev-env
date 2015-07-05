# Docker-based dev env

This is a simple development environment in a docker container. It installs
vim, git, python, my dotfiles, and whatever else I need to have a fully
contained development environment.

# Installation

```sh
make install
```

Running this make target builds the docker image, tags it as 'dev', and
installs a `dev` executable to `/usr/local/bin` which takes care of mounting
`$HOME/workspace` and ssh keys and launching whatever command I type.

# Usage

`dev` just spins up bash in the container and `cd`s to the `pwd`.

`dev <cmd> [...]` starts the container and runs `cmd` with whatever other
parameters I provide. For example:

```sh
$ ls
Dockerfile   Makefile
$ dev vim Dockerfile  # launches vim in the container, editing Dockerfile in pwd
```
