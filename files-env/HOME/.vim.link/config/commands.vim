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

" Save a file using sudo
cmap w!! w !sudo tee % >/dev/null

