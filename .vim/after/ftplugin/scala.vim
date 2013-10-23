
" map <F1> :silent! make! \| redraw! \| cw \|<CR>
setlocal makeprg=sm\ %
setlocal dict+=.classes
setlocal dict+=$HOME/.vim/dict/scala.dict
setlocal noet
setlocal sw=4
setlocal softtabstop=4
setlocal tabstop=4

setlocal errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
"setlocal errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
setlocal errorformat+=,%-G%.%#

noremap <silent> <Leader>ff :cf target/quickfix/sbt.quickfix<CR>
noremap <silent> <Leader>fn :cn<CR>

map <buffer><silent> [[ 0?\v(def\|class\|object\|trait)\C<CR>ztw
map <buffer><silent> ]] /\v(def\|class\|object\|trait)\C<CR>ztw
