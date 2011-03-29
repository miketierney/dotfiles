" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=AnonymousPro:h12     " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
" set background=light              " Background.
set lines=40 columns=180          " Window dimensions.
set cursorline                    " Show the line my cursor is on.
set colorcolumn=85                " The edge of reason

"set guioptions-=r                 " Don't show right scrollbar

" colorscheme sjl-molokai
colorscheme wandering
" colorscheme ir_black

" Enables Cmd-T functionality in MacVim
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen

  set list
  set listchars=tab:▸\ ,eol:¬       " A very TextMate way of showing invisibles.

  " clear the search results highlighting
  nnoremap <leader><space> :noh<cr>
endif
