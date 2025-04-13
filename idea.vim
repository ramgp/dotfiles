let mapleader = " "

set incsearch
set number
set relativenumber
set showmode
set timeoutlen=400
set ttimeoutlen=0
set clipboard=unnamedplus
set scrolloff=10

" enable emulated plugins
set highlightedyank
set surround
set mini-ai
" set commentary

imap jj <Esc>
imap kj <Esc>

noremap c "_c
noremap C "_C
" noremap d "_d
" noremap D "_D
noremap x "_x

map <leader>a :action $SelectAll<CR>
map <leader>b :action GotoDeclaration<CR>
map <leader>c :action $Copy<CR>
map <leader>d :action EditorDuplicate<CR>
map <leader>; di{Vkpgv=
map <leader>e :action RecentFiles<CR>
map <leader>f :action Find<CR>
map <leader>g :action GotoLine<CR>
map <leader>h :action Replace<CR>
map <leader>i :action Inline<CR>
map <leader>j <C-d>
" map <leader>j :action AceAction<CR>
map <leader>k <C-u>
map <leader>m :action EditorScrollToCenter<CR>
map <leader>n :action FileChooser.NewFolder<CR>
map <leader>o :action ShowIntentionActions<CR>
map <leader>p :action GotoFile<CR>
map <leader>q :action QuickJavaDoc<CR>
map <leader>r :action RenameElement<CR>
map <leader>s :action SaveAll<CR>
map <leader>t :action FindInPath<CR>
map <leader>u df(f,cf".<Esc>f"df)
" map <leader>u :s/\(.*\)\(=\|:\)\sv6Utils.getValueAt(\(.*\),\s"\(.*\)"\s)/\1\2\3.\4<CR>
map <leader>v :action $Paste<CR>
map <leader>w ciw
map <leader>x :action EditorCut<CR> <Esc>
map <leader>y :action EditorDeleteLine<CR> <Esc>
map <leader>z :action Vcs.RollbackChangedLines<CR>
map <leader>[ :action EditorCodeBlockStart<CR>
map <leader>] :action EditorCodeBlockEnd<CR>
map <leader>/ :action CommentByLineComment<CR>

nnoremap <silent> s :action AceAction<CR>

" Inserts empty line(s) without leaving normal mode
nnoremap <silent> <leader>0 :action EditorStartNewLine<CR>
" nnoremap <silent> <leader>oo :action EditorSplitLine<CR>
nnoremap <silent> <leader>O :action EditorStartNewLineBefore<CR>
set clipboard+=ideaput
