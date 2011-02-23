let g:browser = 'open -a /Applications/Safari.app '
" On OSX - let g:browser = 'open -a /Applications/Firefox.app'

" Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  execute '!open "' .url. '"'
endfunction
map <silent> <leader>rb :call OpenRubyDoc(expand('<cword>'))<CR><CR>

" Open the Rails ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRailsDoc()
  let url = 'http://apidock.com/rails/'.expand("<cword>")
  execute '!open "' .url. '"'
endfunction
map <silent> <leader>rr :call OpenRailsDoc()<CR><CR>

" Open the Rspec ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRspecDoc(keyword)
  let url = 'http://apidock.com/rspec/'.a:keyword
  execute '!open "' .url. '"'
endfunction
map <silent> <leader>rs :call OpenRspecDoc(expand('<cword>'))<CR><CR>

" Search Rails API
" online documentation search
function! OnlineDoc()
  if &ft =~ "ruby"
    let s:urlTemplate = "http://railsapi.com/doc/rails-v3.0.3/?q=%"
  else
    return
  endif
  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "!open \"" . s:url . "\""
  execute s:cmd
endfunction
map <silent> <leader>r :call OnlineDoc()<CR> 
