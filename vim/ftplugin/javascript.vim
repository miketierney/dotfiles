set cc=80
set ruler

"set list

setlocal makeprg=jslint\ %
setlocal errorformat=%f:%l:%c:%m

let s:showMakeWnd = "0"
function! ToggleMake()
  echo "Make Wnd Mode: " . s:showMakeWnd

  if s:showMakeWnd == "0"
    w
    silent make
    cw
    copen
    cc
  else
    cclose
  endif

  let s:showMakeWnd = (s:showMakeWnd == "0" ? "1" : "0")
endfunction

nmap <silent> <F5> :call ToggleMake()<CR>
