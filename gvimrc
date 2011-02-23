 set font
set guifont=Consolas:h14
set linespace=1
colorscheme dax

" disable expanded macvim toolbar
if has("gui_running")
  set guioptions=egmrt

  " need this to enable the super retarded MacVim horizontal scrollbar
  set guioptions-=b
  set guioptions-=r
endif

" Tweak invisibles color to be a little darker
highlight NonText guifg=#222222
highlight SpecialKey guifg=#222222

" Set window size and position
set lines=48 columns=120 

set relativenumber

" map Command-j to Scroll Down
map <D-j> <C-d>
" map Command-k to Scroll Up
map <D-k> <C-u>

" Open PeepOpen
if has("gui_macvim")
  map <leader>p <Plug>PeepOpen
end

" save sessions with .vis extension
map <leader>s :mksession!  session.vis<CR>
" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %
