set guifont=AnonymousPro:h11
set antialias
set encoding=utf-8
set guioptions-=T
set lines=40 columns=180
set cursorline

set list
set listchars=tab:\ \ ,trail:· " Highlight trailing whitespace and tabs.

color wandering

" Enables Cmd-T functionality in MacVim
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
endif

nnoremap <leader><space> :noh<cr>
