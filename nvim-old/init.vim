call plug#begin()
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/ultisnips"]
Plug 'lervag/vimtex'
    let g:vimtex_view_general_viewer='zathura'
    let g:vimtex_compoiler_method = 'latexmk'
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none
Plug 'tpope/vim-sensible'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

setlocal spell
set spelllang=en
set number
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u








