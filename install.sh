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
		else
			echo
			echo "~/.bash_profile is already exists. Please, make sure that it's source ~/.bashrc"
		fi
	else
		echo ".bashrc already exists. Please remove it or just run uninstall"
	fi
	echo "Done."
}

install_git() {
	echo -n "Install GIT..."
	if [ ! -e ~/.gitconfig ]; then
		ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
	fi
	if [ ! -e ~/.gitignore_global ]; then
		ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
	fi
	if [ ! -e ~/.git_template ]; then
		ln -s ~/.dotfiles/.git_template ~/.git_template
	fi
	echo "Done."
}

install_bin() {
	echo -n "Install ~/bin..."
	if [ ! -e ~/bin ]; then
		mkdir ~/bin
	fi
	if [ ! -e ~/bin/tx ]; then
		ln -s ~/.dotfiles/bin/tx ~/bin/tx
	fi
	if [ ! -e ~/.ackrc ]; then
		ln -s ~/.dotfiles/.ackrc ~/.ackrc
	fi
	echo "Done."
}

install_tmux() {
	echo -n "Install TMUX..."
	if [ ! -e ~/.tmux.conf ]; then
		ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
	fi
	if [ ! -e ~/.tmux_osx.conf ]; then
		ln -s ~/.dotfiles/.tmux_osx.conf ~/.tmux_osx.conf
	fi
	echo "Done."
}

uninstall() {
	rm -rf ~/tmp
	rm ~/.vim
	rm ~/.bash_aliases
	rm ~/.bashrc
	rm ~/.gitignore_global
	rm ~/.git_template
	rm ~/.gitconfig
	rm ~/bin/tx
	rm ~/.tmux.conf
	rm ~/.tmux_osx.conf
}

if [[ $1 == "uninstall" ]]; then
	uninstall
else
	install_bash
	install_bin
	install_git
	install_vim
	install_tmux
	git submodule init
	git submodule update
fi
