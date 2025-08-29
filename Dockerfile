FROM ubuntu:24.04

RUN apt-get update && apt-get install neovim git -y

RUN git clone https://github.com/mdwoold5411/nvim-config.git && \
	mkdir ~/.config && \
	mv nvim-config/nvim ~/.config && \
	rm -rf nvim-config

ENTRYPOINT bash
