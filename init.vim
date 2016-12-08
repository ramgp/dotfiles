syntax on
set encoding=utf-8

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set number
syntax enable
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
