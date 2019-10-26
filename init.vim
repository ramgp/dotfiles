syntax on
set encoding=utf-8

let g:airline_powerline_fonts = 1

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'

" On-demand loading
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set number
syntax enable
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber

colorscheme onedark
let g:airline_theme='onedark'

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabnext<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabnext<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
