" Editor Options
syntax enable
set showcmd
set number
set nocompatible
set scrolloff=5
compiler gcc
set visualbell
set shell=bash
set fileformats=unix
set ff=unix


" Whitespace
set list
set listchars=tab:>=,trail:·,extends:>,precedes:<,nbsp:·
autocmd BufWritePre * :%s/\s\+$//e


" Search Options
set wildmenu
set incsearch
set ignorecase
set hlsearch
set showmatch
set diffopt=filler,iwhite
set smartcase
set grepprg=grep\ -nH\ $*
nnoremap n nzz
nnoremap N Nzz


" Mode Management
inoremap qq <Esc>
nnoremap ; :
noremap <C-;> <Esc>:


" Basic Navigation
nnoremap <C-l> $
nnoremap <C-h> 0
nnoremap <C-j> G
nnoremap <C-k> gg
vnoremap <C-l> $
vnoremap <C-h> 0
vnoremap <C-j> G
vnoremap <C-k> 1G
inoremap <C-l> <End>
inoremap <C-h> <Home>
nnoremap <C-Tab> ^


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


" Buffers & Tabs
cnoremap ls ls!
nnoremap <silent> <Tab> :call SwitchToNextBuffer(1)<cr>:ls!<cr>:echo "To Next Buffer"<cr>
nnoremap <silent> <S-Tab> :call SwitchToNextBuffer(-1)<cr>:ls!<cr>:echo "To Previous Buffer"<cr>


" Functions & Plugins
filetype plugin on
execute pathogen#infect()

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
