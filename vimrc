set nocompatible                " choose no compatibility with legacy vi

set encoding=utf-8

syntax enable
filetype plugin indent on       " load file type plugins + indentation
set number
set ruler
set scrolloff=3                 " Show 3 lines of content around the cursor

let mapleader=","               " Change the <leader> to a comma (easier to reach)

"" Whitespace
set nowrap                                         " don't wrap lines
set tabstop=2                                      " a tab is two spaces
set shiftwidth=2                                   " a tab is two spaces
set expandtab                                      " use spaces, not tabs
set backspace=indent,eol,start                     " backspace through everything in insert mode
set list
set listchars=tab:>·,trail:·,extends:>,precedes:<  " Highlight trailing whitespace and tabs.

"" Modelines
set modeline                    " modeline overrides
set modelines=10

"" Shell
set shell=/bin/zsh

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

" Command-T
"" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
"" Open files, limited to the directory of the current file, with <leader>gf
"" This requires the %% mapping found below
map <leader>gf :CommandTFlush<cr>\|:CommandT %%

" File Navigation
"" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open Files in Directory of Current File
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Matchit
" runtime! plugin/matchit.vim     " Load the matchit plugin

"" Coloring
"color mac_classic
"color ir_black " at least until wandering can be converted properly
"color Tomorrow-Night-Eighties
"color solarized
color wandering

if $TERM=="xterm-256color"
  set t_Co=256                  " enable 256 color support, if available
  let g:solarized_termcolors=256
endif

" Solarized settings
call togglebg#map("<F5>")

"" Meta
set showcmd                     " display incomplete commands
set showmode                    " display the mode you're currently in
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set visualbell                  " No beeping.
set noerrorbells                " I really mean, no beeping.


"" Status Bar
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{rvm#statusline()}%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

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

" Make the current window big, but leave others context
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight will
" fail.
"set winheight=5
"set winminheight=5
"set winheight=999

"" Global key mappings
" Disable the help key, which is inconveniently placed next to the esc key.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"" File-specific
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'  " Conflict markers

" Plugins
" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

" Commenting
let g:NERDCustomDelimiters = {
  \ 'scss' : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
  \ 'sass' : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
\ }

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
  au BufRead,BufNewFile * set list
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
  autocmd FileType css,scss,sass,javascript,jst,eruby.js setlocal shiftwidth=2 tabstop=2 expandtab " foldmethod=indent
  autocmd FileType html,eruby.html setlocal shiftwidth=2 tabstop=2 expandtab

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

" Rails
"" Show current routes in the split
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

"" (RSpec) Tests - Run only the tests you want while moving around
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo

  exec ":!bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  end

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

" Promote variable to let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>ptl :PromoteToLet<cr>

""" Run this file
map <leader>t :call RunTestFile()<cr>
""" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
""" Run all test files
map <leader>a :call RunTests('spec')<cr>

"" File keystrokes
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

"" Command-T Mappings
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gpub :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gst :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gjs :CommandTFlush<cr>\|:CommandT public/javascripts<cr>
map <leader>gaa :CommandTFlush<cr>\|:CommandT app/assets<cr>

" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
