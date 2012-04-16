set guifont=InconsolataForPowerline:h12
set antialias
set encoding=utf-8
set guioptions-=T
set lines=40 columns=180
set cursorline

set expandtab
set tabstop=2
set shiftwidth=2

set list
"set listchars=tab:>- ,trail:· " Highlight trailing whitespace and tabs.

color wandering
"color Tomorrow-Night-Eighties
"color Solarized


" Enables Cmd-T functionality in MacVim
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  let g:Powerline_symbols = 'fancy'
  map <D-t> <Plug>PeepOpen
endif

nnoremap <leader><space> :noh<cr>
