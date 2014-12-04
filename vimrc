set nocompatible                " choose no compatibility with legacy vi

" Enable project-specific vimrc files
set exrc                        " enables per-directory .vimrc files
set secure                      " don't assume good behavior; disable unsafe commands in local .vimrc files

set encoding=utf-8

syntax enable
filetype plugin indent on       " load file type plugins + indentation
set ruler
set scrolloff=3                 " Show 3 lines of content around the cursor
set number                      " Show line numbers.

let mapleader = ","             " Change the <leader> to a comma (easier to reach)
let maplocalleader = "\\"       " Change the <localleader> to a backslash

"" Whitespace
set nowrap                                                " don't wrap lines
set tabstop=2                                             " a tab is two spaces
set shiftwidth=2                                          " a tab is two spaces
set shiftround                                            " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab                                             " use spaces, not tabs
set backspace=indent,eol,start                            " backspace through everything in insert mode
set list
set listchars=tab:>·,trail:·,extends:>,precedes:<,nbsp:.  " Highlight trailing whitespace and tabs.
set autoindent                                            " always set autoindenting on
set copyindent                                            " copy the previous indentation on autindenting
set showmatch                                             " set show matching parenthesis

set pastetoggle=<F2>                                      " allow easy toggling of paste mode

"" Mouse
"set mouse=a

"" History
set history=1000                                   " remember more commands and search history
set undolevels=1000                                " use lots of levels of undo

"" Edit and reload VIMRC easily
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

" Shorten the formatting commands.
vmap Q gq
nmap Q gqap

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.swp,*.bak,*/Build/*,*/build/*,*/dist/*

let g:ctrlp_custom_ignore = {
  \ 'dir' : '\v[\/](\.git|\.hg|\.svn)$',
  \ }

"" Searching
set hlsearch                    " highlighting matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case sensitive...
set smartcase                   " ...unless they contain at least one capital letter
" Clear the search result highlighting, but keep history intact
nnoremap <leader><space> :nohlsearch<CR>

"" Plugins
" Pathogen
call pathogen#helptags()         " initialize Pathogen
call pathogen#infect()
" silent! call pathogen#runtime_append_all_bundles()

" NERDTree
source ~/.vim/vimrc/nerdtree

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

" restart passenger for the current directory
map <leader>rst :!touch tmp/restart.txt<cr>

" clever trick that lets you effectively sudo !! after opnening a file in vim
" (thanks to Steve Lost and Vincent Driessen
cmap w!! w !sudo tee % >/dev/null

map <leader>csc :CSScomb<cr>

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

"" Coloring
colorscheme molokai
"colorscheme solarized

if $TERM=="xterm-256color"
  set t_Co=256                  " enable 256 color support, if available
  let g:solarized_termcolors=256
endif

" Toggle Gundo
nnoremap <F5> :GundoToggle<CR>
imap <F5> <ESC>:GundoToggle<CR>

"" Meta
set showcmd                     " display incomplete commands
set showmode                    " display the mode you're currently in
set nobackup                    " keep no backups
set noswapfile                  " don't store swap files

set visualbell                  " No beeping.
set noerrorbells                " I really mean, no beeping.


"" Status Bar
""" Powerline
set rtp+=/Users/mike/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set noshowmode
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

if ! has("gui_running")
  " Fix terminal vim so it properly leaves insert mode. See https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

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

" Change snipMate trigger key
:imap <leader><tab> <Plug>snipMateNextOrTrigger
:smap <leader><tab> <Plug>snipMateNextOrTrigger

" Make j/k move across lines
nnoremap j gj
nnoremap k gk

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

" Folding

set foldlevelstart=0

" Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za

" "Refocus" folds
nnoremap ,z zMzvzz

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  if (&relativenumber)
    let nucolwidth = &fdc + &relativenumber * &numberwidth
  else
    let nucolwidth = &fdc + &number * &numberwidth
  endif
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

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

" Indentation
if has("gui_macvim") && has("gui_running")
  nmap <D-]> v><ESC>
  nmap <D-[> v<<ESC>
endif

" Commenting
"" Map the commenting command to Command / (when in MacVim), and <leader>/
"" when in terminal vim
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle
endif

let g:NERDCustomDelimiters = {
  \ 'scss' : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
  \ 'sass' : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
  \ 'less' : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
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
  au ColorScheme * highlight ExtraWhitespace guibg=#F8E7E5 guifg=#E05B45 ctermbg=red ctermfg=white
  au BufEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhiteSpace /\s\+$/
  au BufWinLeave * call clearmatches()

  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.css.scss set filetype=scss
  au BufRead,BufNewFile *.js.erb set filetype=eruby.js
  au BufRead,BufNewFile *.html.erb set filetype=eruby.html
  au BufRead,BufNewFile *.jst set filetype=jst
  au BufRead,BufNewFile *.ejs set filetype=jst
  au BufRead,BufNewFile {Gemfile,Rakefile,VagrantFile,Thorfile,config.ru,Capfile}   set ft=ruby
  au BufRead,BufNewFile *.json set ft=javascript
  au BufRead,BufNewFile *.kit set filetype=html
  au BufRead,BufNewFile /usr/local/nginx/conf/* set ft=nginx

  " use closetag plugin to auto-close HTML tags
  " autocmd filetype html,xml,xsl source ~/.vim/scripts/html_autoclosetag.vim

  " Tagbar
  nmap <F8> :TagbarToggle<CR>

  let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
  \ }

  let g:tagbar_type_ruby = {
  \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
    \ ]
  \ }

  " Rainbow Parentheses
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces

  " render YAML front matter inside Textile documents as comments
  autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
  autocmd filetype textile highlight link frontmatter Comment

  " Automatic fold settings for specific files. Uncomment to use.
  " autocmd FileType css,scss,sass setlocal foldmethod=indent shiftwidth=2 tabstop=2
  autocmd FileType css,scss,sass,javascript,jst,eruby.js,coffee setlocal shiftwidth=2 tabstop=2 expandtab " foldmethod=indent
  autocmd FileType html,eruby.html,php setlocal shiftwidth=2 tabstop=2 expandtab

  " HTML Validation Compiler
  au FileType html compiler html
  au QuickFixCmdPost make cwindow " automatically open the quickfix window

  " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec

  " Remember the last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " Saves on blur. Uncomment to use.
  " au FocusLost * :wa

  " Indent Guides settings
  "set ts=4 sw=4 et
  let g:indent_guides_guide_size = 1
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

" Rainbow Parentheses options
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

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

"" File keystrokes
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

"" Ctrl-P Mappings
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gc :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>gh :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>gt :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>gpub :CtrlPClearCache<cr>\|:CtrlP public<cr>
map <leader>gst :CtrlPClearCache<cr>\|:CtrlP public/stylesheets<cr>
map <leader>gjs :CtrlPClearCache<cr>\|:CtrlP public/javascripts<cr>
map <leader>gaa :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn\|node_modules$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$\|\.rbo$\|\.class$\|\.o$\|\~$',
  \ }


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

" Add a number object to CSS, enabling commands like "yiN".
" From http://vimbits.com/bits/334, Steve Losh
onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
  normal! v

  while getline('.')[col('.')] =~# '\v[0-9]'
    normal! l
  endwhile

  if a:whole
    normal! o

    while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
      normal! h
    endwhile
  endif
endfunction

" Add functions to highlight and trim unwanted whitespace.
" Here, 'unwanted' means any spaces before a tab character, or any space or
" tab at the end of a line.
" from: http://vim.wikia.com/wiki/Remove_unwanted_spaces
function TrimWhiteSpace()
  :%s/\s*$//
endfunction

nnoremap <F12> :call TrimWhiteSpace()<CR>

" Tab completion for plugins
set completefunc=syntaxcomplete#Complete

" Add support for reading localized .jshintrc files to Syntastic
function s:find_jshintrc(dir)
  let l:found = globpath(a:dir, '.jshintrc')
  if filereadable(l:found)
    return l:found
  endif

  let l:parent = fnamemodify(a:dir, ':h')
  if l:parent != a:dir
    return s:find_jshintrc(l:parent)
  endif

  return "~/.jshintrc"
endfunction

function UpdateJsHintConf()
  let l:dir = expand('%:p:h')
  let l:jshintrc = s:find_jshintrc(l:dir)
  let g:syntastic_javascript_jshint_conf = l:jshintrc
endfunction

au BufEnter * call UpdateJsHintConf()

let g:syntastic_enable_javascript_checkers = []
let g:syntastic_disabled_filetypes = ['html', 'js']
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['javascript'] }

" Investigate.vim settings
let g:investigate_use_dash=1
let g:investigate_dash_for_javascript="js-libs"
let g:investigate_dash_for_sass="sass-libs"
let g:investigate_dash_for_scss="sass-libs"
nnoremap <leader>h :call investigate#Investigate()<CR>
