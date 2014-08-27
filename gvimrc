set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
set antialias
set encoding=utf-8
set guioptions-=T
set lines=40 columns=180
set cursorline

set expandtab
set tabstop=2
set shiftwidth=2

set list

colorscheme github

let g:Powerline_symbols = 'fancy'

" Enables Cmd-T functionality in MacVim
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
endif

nnoremap <leader><space> :noh<cr>
