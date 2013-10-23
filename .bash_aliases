alias ll="ls -al"

# git 
alias gmlog='git log --pretty=format:"%ad | %h | %s [%an]" --date=iso --since=-40days | sort | grep'

if [[ `uname` = "Darwin" ]]; then
	# Get OS X Software Updates, and update Homebrew, npm, and their installed packages
	alias update='sudo softwareupdate -i -a; brew update; brew upgrade; npm update npm -g; npm update -g'
	if [ -d "/Applications/MacVim.app" ]; then
		alias vi="/Applications/MacVim.app/Contents/MacOS/Vim --servername local"
		alias vim="/Applications/MacVim.app/Contents/MacOS/Vim --servername local"
	fi
else
	alias vi="vim -u ~/.vim/vimrc"
	alias vim="vim -u ~/.vim/vimrc"
fi
