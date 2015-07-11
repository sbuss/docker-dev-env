FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
        vim \
        python python-dev python-pip \
        git bash-completion

RUN adduser --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER dev
WORKDIR /home/dev

RUN git config --global user.email "steven.buss@gmail.com"
RUN git config --global user.name "Steven Buss"

ADD python-requirements.txt /home/dev/
RUN sudo pip install -r python-requirements.txt

ADD dotfiles /home/dev/dotfiles
RUN cd dotfiles && ./setup.sh
