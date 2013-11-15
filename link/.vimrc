" General Settings ------------------------------------------------------------

set nocompatible " Disable Vi compatible mode
set visualbell   " Use the visual bell, instead of the audible bell
set history=1000 " Remember a lot more command history
set autoread     " Reloads a file if it has been changed outside of vim
set showmode     " Show the current mode
set showcmd
set ttyfast
set ruler
set title        " Change terminal window title
set autochdir    " Set the directory to the directory of the active window
set confirm      " Present an option to continue, rather than aborting
set modelines=0

" Make backspace more useful in insert mode
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Use a unix file-type with utf-8 encoding by default
set ffs=unix,dos,mac
set encoding=utf8

" Disable swap files
set nowritebackup
set noswapfile
set nobackup

au VimResized * exe "normal! \<c-w>="


" Setup Plugins ---------------------------------------------------------------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'

runtime macros/matchit.vim

filetype plugin indent on

" Wildmenu Completion ---------------------------------------------------------

set wildmenu
set wildmode=list:longest

set wildignore+=.git,.svn,.hg
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.jpeg
set wildignore+=*.DS_Store
set wildignore+=*.pyc


" Interface Settings ----------------------------------------------------------

" Always show status bar
set laststatus=2

" Enables a distinct line at the position of the cursor
set cursorline

" How many lines between the top or bottom of the cursor
" before the screen starts scrolling
set so=10

" Show line numbers
set number

set textwidth=80
set colorcolumn=80

" Automatically reload a file when modified by another process
set autoread

set list
set listchars=tab:▸\ ,trail:·

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


" Key mappings ----------------------------------------------------------------

let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w  :w!<cr>
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
nnoremap <left>    :bp<cr>
nnoremap <right>   :bn<cr>

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


" Formatting Settings ---------------------------------------------------------

" Use spaces instead of tabs
set autoindent
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

let g:solarized_termtrans = 1
colorscheme solarized
set background=dark

