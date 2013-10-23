#!/bin/bash

# VIM
install_vim() {
	echo "Install VIM..."
	if [ ! -d ~/tmp/vim ]; then
		mkdir -p ~/tmp/vim/undotree
	fi
	if [ ! -e ~/.vim ]; then
		ln -s ~/.dotfiles/.vim ~/.vim
	fi
	echo "Done."
}

uninstall() {
	rm -rf ~/tmp
	rm ~/.vim
}

git submodule init
install_vim
