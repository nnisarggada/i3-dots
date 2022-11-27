" Set compatibility to Vim only
set nocompatible

" Show line numbers
set number

" Status Bar
set laststatus=2

" Auto wrap text
set wrap

" Syntax highlighting
filetype plugin indent on
if has("syntax")
	syntax on
endif

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif
