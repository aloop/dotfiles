nmap , <leader>
nmap <space> <leader>

" Easier command access
nnoremap ; :

" Jump by three lines instead of one
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Undo & Redo
nnoremap <leader>z :undo<cr>
nnoremap <leader>Z :redo<cr>

" Open a vertical split and focus it
nnoremap <leader>v <C-w>v<C-w>l

" Easier window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Fast window switching
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" Quick navigation through buffers
nnoremap <left>     :bp<cr>
nnoremap <right>    :bn<cr>
nnoremap <leader>ls :ls<cr>
nnoremap <leader>bd :bd!<cr>

" Temporarily disable search highlighting
nnoremap <leader><cr> :nohl<cr>

" Skip past wrapped lines
nnoremap j gj
nnoremap k gk

" Select the entire buffer
nnoremap <leader>a ggVG

" Easy toggle when pasting formatted code
set pastetoggle=<F2>

" Vertically center search match
nnoremap n nzzzv
nnoremap N Nzzzv

nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>

" Move lines around like sublime
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<mt1>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has('mac') || has('macunix')
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

