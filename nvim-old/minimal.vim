set nocompatible
filetype plugin indent on
syntax enable

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
call plug#end()
