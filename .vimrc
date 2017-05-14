" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" tpope
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
" " JavaScript
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'moll/vim-node'
Plugin 'digitaltoad/vim-pug'
Plugin 'groenewege/vim-less'
" " Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'nvie/vim-flake8'

" " Scala
Plugin 'derekwyatt/vim-scala'
"Plugin 'ensime/ensime-vim'

" " Haskell
Plugin 'neovimhaskell/haskell-vim'


" Naviation and Interface
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'

" Colors
Plugin 'vim-scripts/colorsupport.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()

filetype plugin indent on

" Editor Options
syntax enable
set showcmd
set number
set scrolloff=10
set visualbell
set backspace=indent,eol,start
set mouse=a
set ruler
set laststatus=2
set ttyfast
"set ttymouse=xterm2
set cursorline

" Folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Mode
nnoremap ; :
cnoremap W w
cnoremap Q q

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $

" Leader
let mapleader=","

" Buffers
autocmd BufEnter * silent! lcd %:p:h

" Whitespace
set list
set listchars=tab:=-,trail:·,extends:>,precedes:<,nbsp:·
"autocmd BufWritePre * :%s/\s+$//e

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

" Wildmenu
set wildmenu

" Colors
"autocmd VimEnter * :colorscheme Monokai
autocmd VimEnter * :colorscheme zenburn
set colorcolumn=80
au VimEnter * highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

set t_ut=

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ['../include', 'include', '../inc', 'inc']
let g:syntastic_javascript_checkers = ['jslint']

" delimitMate
let delimitMate_expand_cr = 1

" Ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTREE.isTabTree()) | q | endif

" Airline
au VimEnter * :AirlineTheme zenburn
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#color_template = 'normal'
set noshowmode

" Tabular
au BufRead,BufNewFile *.hs,.lhs :let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a: :Tabularize /:<CR>
vmap a- :Tabularize /-><CR>

" TagBar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Language Specifics
" C/C++
"fu s:c_syntax_specifics_setlocal()
"  setlocal tabstop=4
"  setlocal shiftwidth=4
"  setlocal comments-=://
"  setlocal comments+=f://
"endfunction
"au BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp s:c_syntax_specifics_setlocal()
"
" Scala

