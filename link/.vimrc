"""""""""""""""""""""""""""""""""""""""""""""
"
" Modified: July 5, 2013
"
" Thanks To: Too many resources, can't recall :/
"
" Todo: Cleanup, go through settings and remove those that I don't use anymore
"
"""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""
" Plugins & Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""
"  General Settings
"""""""""""""""""""""""""""""""""""""""""""""
" Disable compatible mode, even when vim is started with -C
set nocompatible

" Use UTF-8 by default
set encoding=utf8

" Enable filetype plugin
filetype plugin indent on

" Disable annoying beeps
set noerrorbells
set novisualbell

" Remember more command history and undo levels
set history=500
set undolevels=1000

set ttyfast
set ruler

" Use a unix file-type by default
set ffs=unix,dos,mac

set modelines=0

" Open NERDTree automatically if vim is opened without a file
autocmd vimenter * if !argc() | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""
" Interface Settings
"""""""""""""""""""""""""""""""""""""""""""""
" Unleash the wild!
set wildmenu

" Always show status bar
set laststatus=2

" Change the terminal title
set title

set hidden

" Enables a distinct line at the position of the cursor
set cursorline

" How many lines between the top or bottom of the cursor
" before the screen starts scrolling
set so=10

"""""""""""""""""""""""""""""""""""""""""""""
" Interface Settings
"""""""""""""""""""""""""""""""""""""""""""""
" Helps during searches
set ignorecase
set smartcase

" Search incrementally as you type
set incsearch

" Highlight search results
set hlsearch

set magic

set showmatch

" Show line numbers
set number

"""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""
" Set the leader key
let mapleader = ","
let g:mapleaer = ","

" Fast saving
nnoremap <leader>w  :w!<cr>
nnoremap <leader>q  :q<cr>
nnoremap <leader>wq :wq<cr>

" More saving helpers
nnoremap <C-s> :w!<cr>

" Toggle nerdtree
map <leader>t :NERDTreeToggle<cr>

" Swap single and double quotes
nnoremap <leader>" cs'"
nnoremap <leader>' cs"'

" Open a vertical split and focus it
nnoremap <leader>v <C-w>v<C-w>l

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Map undo to ctrl-z
nnoremap <C-z> :u<cr>

" Quick navigation through buffers
nnoremap <left>    :bp<cr>
nnoremap <right>   :bn<cr>

nnoremap j gj
nnoremap k gk

" Easier command access
nnoremap ; :

" Easy toggle when pasting formatted code
set pastetoggle=<F2>

" Helpful when you haven't started with root privileges
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""
" Formatting Settings
"""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

set smarttab

set tabstop=4
set shiftwidth=4
set shiftround

set backspace=indent,eol,start

set autoindent
set copyindent


"""""""""""""""""""""""""""""""""""""""""""""
" Color Settings
"""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set t_Co=256

let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""
" Buffer Settings
"""""""""""""""""""""""""""""""""""""""""""""

set textwidth=80
set colorcolumn=80

" Automatically reload a file when modified by another process
set autoread

" Autosave when buffer loses focus
au FocusLost * :wa

" I don't need these...
set nobackup
set nowritebackup
set noswapfile

set list
set listchars=tab:▸\ ,trail:.

try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" from http://amix.dk/vim/vimrc.html
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%
