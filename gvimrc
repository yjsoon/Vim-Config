" set font
set guifont=Menlo:h13
set linespace=1

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


" Open PeepOpen
"if has("gui_macvim")
"  macmenu &File.New\ Tab key=<nop>
"  map <D-t> <Plug>PeepOpen
"end
