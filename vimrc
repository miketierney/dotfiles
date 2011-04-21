" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

filetype off                      " Forces the filetype settings to reset (mostly for Debian systems)
call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

" enable 256 colors in vim
" set t_Co=256

" colorscheme topfunky-light
colorscheme railscasts

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime! macros/matchit.vim       " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set modeline                      " allow files to include a 'mode line' to override vim defaults
set modelines=5                   " check the first 5 lines for a modeline

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set autoindent                    " always set autoindenting on
set copyindent                    " copy the previous indentation on autoindenting

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore=*.swp,*.bak,.o,*.obj,.git,*.rbc

" Taming searching and movement
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set gdefault                      " Apply substitutions globally on lines. Single substitutions can be done by appending 'g' to the search pattern

" clear the search results highlighting
nnoremap <leader><space> :let @/=""<CR>

nnoremap / /\v
vnoremap / /\v

" Controversial...swap colon and semicolon for easier commands
" Using ;; to restore the origin ; (repeat previous command) functionality
nnoremap ; :
" nnoremap : ;
nnoremap ;; ;

vnoremap ; :
" vnoremap : ;
vnoremap ;; ;

" Changing bracket pair matching movements from % to <tab>, since it's more
" natural
nnoremap <tab> %
vnoremap <tab> %
inoremap <tab> <C-P>

set smarttab                      " insert tabs on the start of a line according to shiftwidth, not tabstop

set number                        " Show line numbers.
set ruler                         " Show cursor position.
" set invlist                      " Show invisible characters.
" set list
" set listchars=tab:>,eol:$,extends:#,nbsp:_
set cursorline                    " Show the line my cursor's on

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch                    " set show matching parenthesis 

set wrap                          " Turn on line wrapping.
" set textwidth=79
set formatoptions=qrn1

if exists("&colorcolumn")
  set colorcolumn=85
endif

set scrolloff=3                   " Show 3 lines of context around the cursor.

set visualbell                    " No beeping.
set noerrorbells                  " I really mean, no beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " do not write annoying intermediate swap files,
                                  "     who did ever restore from swap files
                                  "     anyway?
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set softtabstop=2
set shiftround                   " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab                    " Use spaces instead of tabs

set laststatus=2                 " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline=\
set statusline+=%f\                         " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{&fileformat}]             " file format
set statusline+=%h%1*%m%r%w%0*              " flag
set statusline+=%=                          " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P       " offset

" Editor layout
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                   " don't update the display while executing macros

set showtabline=2                " show a tabbar on top, always
set cmdheight=2                  " use a status bar that is 2 rows high

" Vim behavior

set history=1000                 " remember more commands and search history
set undolevels=1000              " use many muchos levels of undo


let mapleader = ","

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Some shortcuts
" * scroll up and down 10 lines at a time
noremap <C-K> 10k
noremap <C-J> 10j

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Uncomment to use Jamis Buck's file opening plugin
" Requires the fuzzy_file_finder gem to be installed
" map <Leader>ff :FuzzyFinderTextMate<Enter>

" Ragtag stuff
let g:ragtag_global_maps = 1

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>"

" Easy window navigation
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Filetype specific handling
" only do this part when compiled with support for autocommands
if has("autocmd")
  augroup vim_files
    au!
    autocmd filetype cmd set expandtab    " disallow tabs in Vim files
  augroup end

  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead, BufNewFile *.js.erb set filetype=eruby.js
  au BufRead, BufNewFile *.html.erb set filetype=eruby.html

  " use closetag plugin to auto-close HTML tags
  autocmd filetype html,xml,xsl source ~/.vim/scripts/html_autoclosetag.vim

  " render YAML front matter inside Textile documents as comments
  autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
  autocmd filetype textile highlight link frontmatter Comment

  " Automatic fold settings for specific files. Uncomment to use.
  " autocmd FileType css,scss,sass  setlocal foldmethod=indent shiftwidth=2 tabstop=2
  autocmd FileType css,scss,sass  setlocal shiftwidth=2 tabstop=2

  " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec

  " Saves on blur
  au FocusLost * :wa
endif " has("autocmd")

" De-conflicting the rooter <Leader>cd mapping
map <silent> <unique> <Leader>rcd <Plug>RooterChangeToRootDirectory

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>egv :e $MYGVIMRC<CR>
nmap <silent> <leader>sgv :so $MYGVIMRC<CR>

"NERD Tree Plugin
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', '\.obj$', '\.o$', '\.so$', '^\.git$']
map <Leader>n :NERDTreeToggle<CR>

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" Conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'
au filetype vim set formatoptions-=o
                     " somehow, during vim filetype detection, this gets set,
                     " so explicitly unset it again for vim files

" shortcut to jump to next conflict marker
nmap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" Extra user or machine specific settings
" source ~/.vim/user.vim

" Settings for explorer.vim
let g:explHideFiles='^\.'

" * Window splits

" Open new horizontal split windows below current
set splitbelow

" Open new vertical split windows to the right
set splitright

" Disable the help key, which is inconveniently placed next to the esc key. Dumb.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Some nice custom commands
" ============================================
" strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack is awesome
nnoremap <leader>a :Ack

" HTML Tag Folding
nnoremap <leader>ft Vatzf

" Sort CSS Properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Imitates TextMate's ctrl+Q function to re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Exit out of insert mode and back to normal mode without the use of <ESC>
inoremap <C-c> <ESC>

" Helpful rails expander. Temporary until I find a better way to do this.
inoremap <C-l> <Space>=><Space>

" Expose scopes for colorscheming
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
