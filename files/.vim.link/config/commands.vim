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

" Save a system file even if vim was launched without root privileges.
" I am unsure where this snippet is orignially from.
cmap w!! w !sudo tee % >/dev/null

