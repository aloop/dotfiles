
" TODO: Trim the fat and modularize

" Disable Vi compatible mode
set nocompatible

" Start Vundle setup
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle can manage itself
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
"Plugin 'crooloose/syntastic'
Plugin 'kien/ctrlp.vim'

" Color Schemes
Plugin 'sickill/vim-monokai'

call vundle#end()

filetype plugin indent on
" End Vundle setup


" Airline Config
let g:airline_powerline_fonts = 1
let g:airline_enable_branch   = 1
let g:airline#extensions#tabline#enabled = 1


set history=1000    " Remember a lot more command history
set undolevels=1000 " And a lot more undo levels
set hidden          " Allow unsaved buffers in the background
set ttyfast
set ruler           " Show the current row and column number
set title           " Change terminal window title
set autochdir       " Set the directory to the directory of the active window

" Don't beep!
set visualbell
set noerrorbells

" Make backspace more useful in insert mode
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Prefer a unix file-type with utf-8 encoding by default
set ffs=unix,dos,mac
set encoding=utf8

" Disable swap files
set nowritebackup
set noswapfile
set nobackup

" Automatically resize split views when vim is resized
au VimResized * exe "normal! \<c-w>="


" Key mappings ----------------------------------------------------------------

let mapleader = ","
let g:mapleader = ","


" Fast saving
nnoremap <leader>w  :w<cr>
nnoremap <leader>q  :q<cr>
nnoremap <leader>wq :wq<cr>

" Jump by three lines instead of one
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Open a vertical split and focus it
nnoremap <leader>v <C-w>v<C-w>l

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick navigation through buffers
nnoremap <left>     :bp<cr>
nnoremap <right>    :bn<cr>
nnoremap <leader>ls :ls<cr>


nnoremap j gj
nnoremap k gk

" Easier command access
nnoremap ; :

" Easy toggle when pasting formatted code
set pastetoggle=<F2>

nnoremap n nzzzv
nnoremap N Nzzzv

" Sudo write
cmap w!! w !sudo tee % >/dev/null


" Wildmenu Completion ---------------------------------------------------------

set wildmenu
set wildmode=list:longest

" Version control ignores
set wildignore+=.git,.svn,.hg
" Image file ignores
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.jpeg
" System/Temp file ignores
set wildignore+=*.DS_Store,*.swp,*.bak
" Compiled file ignores
set wildignore+=*.pyc


" File & Folder navigation

" Automatically change the directory to the current buffers directory
autocmd BufEnter * :cd %:p:h


" Interface Settings ----------------------------------------------------------

" Always show the statusline
set laststatus=2

" Enables a distinct line at the position of the cursor
set cursorline

" How many lines between the top or bottom of the cursor
" before the screen starts scrolling
set so=10

" Show line numbers
set number

" Show a column at the specified width for the preferred line width
set colorcolumn=80

set list listchars=tab:»-,trail:·,extends:»,precedes:«

" Return to last edit position when opening files
" from http://amix.dk/vim/vimrc.html
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%


" Search Settings -------------------------------------------------------------

set ignorecase " Disable case-sensitivity in searches
set smartcase  " As long as there isn't an uppercase letter in the pattern

" Search incrementally as you type
set incsearch

" Highlight search results
set hlsearch
set magic
set showmatch


" Formatting ------------------------------------------------------------------

set autoindent
set copyindent
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Color Settings --------------------------------------------------------------

if has("gui_running")
    set t_Co=256
endif

colorscheme monokai
