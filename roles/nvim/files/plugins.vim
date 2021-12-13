" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/autoload/plugged')
  Plug 'tpope/vim-surround'

  " Better Syntax Support
  " Plug 'sheerun/vim-polyglot'
  " File Explorer
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " Status info
  Plug 'itchyny/lightline.vim'

"  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'

  " Commenting
  Plug 'tpope/vim-commentary'

  " Color themes
  Plug 'joshdick/onedark.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'sainnhe/gruvbox-material'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'


  Plug 'tpope/vim-fugitive'
  Plug 'machakann/vim-highlightedyank'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
