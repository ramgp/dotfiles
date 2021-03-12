set incsearch
set number
set relativenumber
set showmode
set timeoutlen=500
set clipboard=unnamedplus
set scrolloff=10
set highlightedyank

imap jj <Esc>
imap jk <Esc>
imap kj <Esc>

let mapleader = " "
map <leader>a :action $SelectAll<CR>
map <leader>b :action GotoDeclaration<CR>
map <leader>c :action $Copy<CR>
map <leader>d :action EditorDuplicate<CR>
map <leader>e :action RecentFiles<CR>
map <leader>f :action Find<CR>
map <leader>g :action GotoLine<CR>
map <leader>h :action Replace<CR>
map <leader>i :action ImplementMethods<CR>
map <leader>j :action Back<CR>
map <leader>k :action Forward<CR>
map <leader>m :action EditorScrollToCenter<CR>
map <leader>n :action FileChooser.NewFolder<CR>
map <leader>o :action OverrideMethods<CR>
map <leader>p :action GotoFile<CR>
map <leader>q :action QuickJavaDoc<CR>
map <leader>r :action RenameElement<CR>
map <leader>s :action SaveAll<CR>
map <leader>t :action Vcs.UpdateProject<CR>
map <leader>u :action GotoSuperMethod<CR>
map <leader>v :action $Paste<CR>
map <leader>w :action EditorSelectWord<CR>
map <leader>x :action $Cut<CR>
map <leader>y :action EditorDeleteLine<CR>
map <leader>z :action Vcs.RollbackChangedLines<CR>
map <leader>[ :action EditorCodeBlockStart<CR>
map <leader>] :action EditorCodeBlockEnd<CR>

