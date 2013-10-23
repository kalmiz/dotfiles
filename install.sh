#!/bin/bash

# VIM
install_vim() {
	echo -n "Install VIM... "
	if [ ! -d ~/tmp/vim ]; then
		mkdir -p ~/tmp/vim/undotree
	fi
	if [ ! -e ~/.vim ]; then
		ln -s ~/.dotfiles/.vim ~/.vim
	fi
	echo "Done."
}

install_bash() {
	echo -n "Install Bash... "
	if [ ! -e ~/.bash_aliases ]; then
		ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
	fi
	echo "Done."
}

uninstall() {
	rm -rf ~/tmp
	rm ~/.vim
	rm ~/.bash_aliases
}

git submodule init
git submodule update
install_bash
install_vim
