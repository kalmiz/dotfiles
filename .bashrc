# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
export PS1="\[\033]0;\w\007\]$PS1"
export PATH="$HOME/bin:$PATH"
export TERM="xterm-256color"
if [ -d "/Applications/MacVim.app" ]; then
	export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim --servername local"
else
	export EDITOR="vim"
fi
export VISUAL=$EDITOR
export MYSQL_PS1="\u@\h:\d> "
export LANG=en_US.utf8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export JAVA_OPTS="-Djava.awt.headless=true"

shopt -s expand_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d ~/.alias.d ]; then
    . ~/.alias.d/*
fi
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -d /usr/local/etc/bash_completion.d ]; then
    . /usr/local/etc/bash_completion.d/*
fi

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local      YELLOW="\[\033[1;33m\]"
  local       RESET="\[\e[0m\]" 
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

  #export PS1="\[\033]0;\w\007\]$YELLOW\$(parse_git_branch)$RESET $PS1"
  export PS1="$YELLOW\$(parse_git_branch)$RESET$PS1"
}
proml

set -o vi
set editing-mode vi
set keymap vi
set convert-meta on

# Settings for OSX
if [[ `uname` = "Darwin" ]]; then
	export PATH="$PATH:/usr/local/bin"
fi

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

if [ -d ~/Projects/gawker ]; then
	export CDPATH="$CDPATH:$HOME/Projects/gawker"
fi

export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

bind '"\e[5C": forward-word'
bind '"\e[5D": backward-word'
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

