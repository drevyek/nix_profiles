" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'colorsupport.vim'
Plugin 'Indent-Guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on

" Editor Options
syntax enable
set showcmd
set number
set scrolloff=15
set visualbell
set backspace=indent,eol,start
set mouse=a
set ruler
set laststatus=2
set ttyfast
set ttymouse=xterm2
let mapleader="\\"

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
vnoremap <Tab> > indent on SwitchToNex
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

" Wildmenu
set wildmenu

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

" Background Colors
autocmd VimEnter * :colorscheme molokai
set t_ut=

" Indent Guides
autocmd VimEnter * :IndentGuidesEnable
let g:indent_guides_guide_size = 0
let g:indent_guides_start_level = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_exclude_filetype = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=235
hi IndentGuidesEven ctermbg=234

" YCM
autocmd VimEnter * :YcmCompleter
let g:ycm_error_symbol = 'x'
let g:ycm_max_diagnostics_to_display = 15
