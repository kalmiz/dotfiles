
if expand('%:p') =~ '^/www/ganja'
	setlocal tags=/www/tags
	setlocal noet
	setlocal sw=4
	setlocal ai
endif

map <buffer><silent> [[ 0?\v(function\|class\|trait)\C<CR>ztw
map <buffer><silent> ]] /\v(function\|class\|trait)\C<CR>ztw
