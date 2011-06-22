set guifont=Consolas:h14
set antialias
set linespace=1

" disable expanded macvim toolbar
if has("gui_running")
  set guioptions=egmrt
  " need this to enable the super retarded MacVim horizontal scrollbar
  set guioptions-=b
  set guioptions-=r
endif

" Set window size and position
set lines=60 columns=130 

set relativenumber

" map Command-j to Scroll Down
map <D-j> <C-d>
" map Command-k to Scroll Up
map <D-k> <C-u>

" save sessions with .vis extension
map <leader>s :mksession!  session.vis<CR>
" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %
