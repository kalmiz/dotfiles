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
	
	if [ ! -e ~/.bashrc ]; then
		ln -s ~/.dotfiles/.bashrc ~/.bashrc
		if [ ! -e ~/.bash_profile ]; then
			echo "if [ -e ~/.bashrc ]; then source ~/.bashrc; fi;" > ~/.bash_profile
		fi 
	else 
		echo ".bashrc already exists, please remove it or just run uninstall"
	fi
	echo "Done."
}

uninstall() {
	rm -rf ~/tmp
	rm ~/.vim
	rm ~/.bash_aliases
	rm ~/.bashrc
}

if [[ $1 == "uninstall" ]]; then
	uninstall
else
	git submodule init
	git submodule update
	install_bash
	install_vim
fi
