" Set compatibility to Vim only
set nocompatible

" Show line numbers
set number

" Status Bar
set laststatus=2

" Auto wrap text
set wrap

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif
