" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" <leader><leader> is more convenient than <c-^>
nnoremap <leader><leader> <c-^>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" nnoremap <leader>s :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move highlithted line(s) down
vnoremap J :m '>+1<CR>gv=gv

" Move highlithted line(s) up
vnoremap K :m '<-2<CR>gv=gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Delete to black hole register
nnoremap <leader>y "_dd

" Editor tabs
nnoremap <leader>n :tabnew<Space>
nnoremap <leader>k :tabnext<CR>
nnoremap <leader>j :tabnext<CR>
nnoremap <leader>h :tabnext<CR>
nnoremap <leader>l :tabnext<CR>

map <C-n> :NERDTreeToggle<CR>
" map <C-p> :Files<CR>
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Copy all
map <leader>aa :%y+<CR>

" Delete all
map <leader>dd :%d<CR>

" Delete curly braces sorrounding lines
nnoremap <leader>; di{Vkpgv=

" Using lua functions
nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

