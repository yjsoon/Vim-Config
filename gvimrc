" set font
set guifont=Inconsolata:h16
set linespace=1

" turn on line numbering
set number

" disable expanded macvim toolbar
if has("gui_running")
  set guioptions=egmrt

  " need this to enable the super retarded MacVim horizontal scrollbar
  set guioptions+=b
endif

" Tweak invisibles color to be a little darker
highlight NonText guifg=#222222
highlight SpecialKey guifg=#222222

" Set window size and position
set lines=48 columns=100 
