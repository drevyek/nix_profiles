" Editor Options
syntax enable
set showcmd
set number
set scrolloff=5
set visualbell
set backspace=indent,eol,start

" Mode Management
inoremap qq <Esc>
nnoremap ; :
noremap <C-;> <Esc>

" Whitespace
set list
set listchars=tab:>=,trail:·,extends:>,precedes:<,nbsp:·
autocmd BufWritePre * :%s/\s+$//e
nnoremap <Enter><Enter> o<Esc>k

" Tabbing
filetype indent on
vnoremap <Tab> >
vnoremap <S-Tab> <
inoremap <S-Tab> <Esc><<i
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

" Buffers
cnoremap ls ls!
nnoremap <silent> <Tab> :call SwitchToNextBuffer(1)<cr>:ls!<cr>:echo "To Next Buffer"<cr>
nnoremap <silent> <S-Tab> :call SwitchToNextBuffer(-1)<cr>:ls!<cr>:echo "To Previous Buffer"<cr>

" Functions
function! SwitchToNextBuffer(incr)
  let help_buffer = (&filetype == 'help')
  let current = bufnr("%")
  let last = bufnr("$")
  let new = current + a:incr
  while 1
    if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
      execute ":buffer ".new
      break
    else
      let new = new + a:incr
      if new < 1
        let new = last
      elseif new > last
        let new = 1
      endif
      if new == current
        break
      endif
    endif
  endwhile
endfunction

" Plugins
filetype plugin on
execute pathogen#infect()
