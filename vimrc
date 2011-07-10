" no vi compatibility
set nocompatible

" load all bundles
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" syntax highlighting
syntax on
set background=dark
colorscheme solarized

set modelines=0
set laststatus=2

" set the :LEADER key to ,
let mapleader = ","

" General Settings
set wrap
set linebreak
set nolist
set hidden
set wildmenu


" Tabs
set tabstop=4 " Use 2 spaces for tabs
set smarttab " Automatic indenting
set shiftwidth=2 " sets spaces used for indention
set autoindent " continue indention from previous line
set expandtab " tab key inserts spaces instead of tabs
set backspace=2 " start,indent
set ruler

" Personalisations 
set encoding=utf-8
set visualbell

" Regex handling - less \s, case handling
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" Searching
set incsearch
set showmatch 
set hlsearch
" \space will clear searches
nnoremap <leader><space> :noh<cr>
" % - bracket matching
"nnoremap <tab> %
"vnoremap <tab> %

" Save on losing focus
" au FocusLost * :wa

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
set nobackup " Do not write backup files to disk
set noswapfile " Do not use swapfiles (they have trouble with large files)

set wildignore+=*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.swp,*.jar,*.zip,*.gem,.DS_Store,log/**,tmp/**,coverage/**,rdoc/**

" additional support for some file types
autocmd BufRead *.html.erb set ft=eruby.html
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

set whichwrap+=<,>,h,l " allow backspace and cursor keys to cross line boundaries

" map Shift-U to REDO
map <S-u> <C-r>

" NERDTree (Command-d / Leader-d)
map <leader>d :NERDTreeToggle<CR>
map <D-d> :NERDTreeToggle<CR>
" map <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
" navigates nerdtree to the current file
map <leader><S-d> :NERDTree %:p:h<CR> 

" NERD Commenter Sucks balls. Use tComment instead!
nmap <D-/> gc
vmap <D-/> gcgv

" Toggle show invisibles
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Setup Command-t shortcut
map <D-t> <leader>t
let g:CommandTMatchWindowAtTop=1

" Set up Ack shortcuts (literal vs nonliteral)
map <leader>a :Ack -Q 
map <leader><S-a> :Ack 

" Setup Command-e to use ctags (Control-])
map <D-e> <C-]>

" Replicate textmate CMD-[ and CMD-] for indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Easy edit helpers
" http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
"map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Replicate textmate shift arrow/movement in order to select stuff
nmap <S-up> vk
vmap <S-up> k
nmap <S-k> vk
vmap <S-k> k
nmap <S-right> vl
vmap <S-right> l
nmap <S-l> vl
vmap <S-l> l
nmap <S-down> vj
vmap <S-down> j
nmap <S-j> vj
vmap <S-j> j
nmap <S-left> v
vmap <S-left> h
nmap <S-h> vh
vmap <S-h> h

" Clean up the trailing spaces
nmap <leader><S-s> :call Preserve("%s/\\s\\+$//e")<CR>

" Retab the document (tabs to spaces)
nmap <silent> <leader><S-t> :retab!<CR>

" Window control: ,w to open new window and switch to it
nnoremap <leader>n <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Markdown
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END
nmap <leader>m :set syntax=markdown<cr>

" Zen Coding
let g:user_zen_leader_key = "<C-z>"

" YankRing
let g:yankring_history_dir = '/tmp'
map <C-y> :YRShow<cr>

" Some settings for LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Join lines
nmap <leader>J :join<cr>

" BufExplorer
let g:bufExplorerSplitBelow=1        " Split new window below current.

" Change directory
map <leader>cd :cd %:p:h<CR>

" Statusline
":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ [BRANCH=%{fugitive#statusline()}] 
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%3*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%3*\ (%P)    "percent through file
set statusline +=%1*%4c\ %*             "column number
set statusline +=%2*%{fugitive#statusline()}\ %*          "git branch
hi User1 guifg=#b58900 guibg=#073642
hi User2 guifg=#dc322f guibg=#073642
hi User3 guifg=#586e75 guibg=#073642
hi User4 guifg=#859900 guibg=#073642
hi User5 guifg=#cb4b16 guibg=#073642


" Edit vimrc
nmap <silent> <leader>ev :tabe $MYVIMRC<cr>
" Leader-v reloads the vimrc -- making all changes active (have to save first)
map <silent> <leader>sv :source ~/.vimrc<CR>:source ~/.gvimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>:NERDTreeClose<CR>
