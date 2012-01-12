set nocompatible                " choose no compatibility with legacy vi

set encoding=utf-8

syntax enable
filetype plugin indent on       " load file type plugins + indentation
set number
set ruler
set scrolloff=3                 " Show 3 lines of content around the cursor

let mapleader=","               " Change the <leader> to a comma (easier to reach)

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is two spaces
set shiftwidth=2                " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set list
set listchars=tab:\ \ ,trail:·  " Highlight trailing whitespace and tabs.

"" Modelines
set modeline                    " modeline overrides
set modelines=10

"" Commands
if has("eval")
  function! SL(function)
    if exists('*'.a:function)
      return call(a:function,[])
    else
      return ''
    endif
  endfunction
endif

"" Formatting
set cursorline                  " display the currently active line
set formatoptions=qrn1          " this affects vim's auto-formatting. See :help fo-table for more details.
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"" Searching
set hlsearch                    " highlighting matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case sensitive...
set smartcase                   " ...unless they contain at least one capital letter
" Clear the search result highlighting
nnoremap <leader><space> :let @/=""<CR>

"" Plugins
" Pathogen
call pathogen#helptags()         " initialize Pathogen
call pathogen#infect()
" silent! call pathogen#runtime_append_all_bundles()

" Matchit
" runtime! plugin/matchit.vim     " Load the matchit plugin

"" Coloring
" color mac_classic
"color ir_black " at least until wandering can be converted properly
color Tomorrow-Night-Eighties

if $TERM=="xterm-256color"
  set t_Co=256                  " enable 256 color support, if available
endif

"" Meta
set showcmd                     " display incomplete commands
set showmode                    " display the mode you're currently in
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set visualbell                  " No beeping.
set noerrorbells                " I really mean, no beeping.


"" Status Bar
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

"" Buffers
set hidden                      " better support for multiple buffers

"" Movement
" scroll up and down 10 lines at a time
noremap <C-K> 10k
noremap <C-J> 10j
" Changing bracket pair matching movements from % to <tab>, since
" it's more natural
nnoremap <tab> %
vnoremap <tab> %

"" Tabs
"map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

"" Windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Splits
set splitbelow " Open new horizontal split windows below current
set splitright " Open new vertical split windows to the right

"" Global key mappings
" Disable the help key, which is inconveniently placed next to the esc key.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"" File-specific
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'  " Conflict markers

" Commenting
let NERD_scss_alt_style=1

" only do this part when compiled with support for autocommands
if has("autocmd")
  augroup vim_files
    au!
    autocmd filetype cmd set expandtab        " disallow tabs in Vim files
  augroup end

  " Remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=#F8E7E5 guifg=#E05B45
  au ColorScheme * highlight ExtraWhitespace guibg=#F8E7E5 guifg=#E05B45
  au BufEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhiteSpace /\s\+$/
  au BufWinLeave * call clearmatches()

  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.js.erb set filetype=eruby.js
  au BufRead,BufNewFile *.html.erb set filetype=eruby.html
  au BufRead,BufNewFile *.jst set filetype=jst
  au BufRead,BufNewFile *.ejs set filetype=jst
  au BufRead,BufNewFile {Gemfile,Rakefile,VagrantFile,Thorfile,config.ru}   set ft=ruby
  au BufRead,BufNewFile *.json set ft=javascript

  " use closetag plugin to auto-close HTML tags
  " autocmd filetype html,xml,xsl source ~/.vim/scripts/html_autoclosetag.vim

  " render YAML front matter inside Textile documents as comments
  autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
  autocmd filetype textile highlight link frontmatter Comment

  " Automatic fold settings for specific files. Uncomment to use.
  " autocmd FileType css,scss,sass setlocal foldmethod=indent shiftwidth=2 tabstop=2
  autocmd FileType css,scss,sass,javascript,jst setlocal shiftwidth=2 tabstop=2 expandtab " foldmethod=indent

  " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec

  " Remember the last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " Saves on blur. Uncomment to use.
  " au FocusLost * :wa
endif " has("autocmd")

" Formatting

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
