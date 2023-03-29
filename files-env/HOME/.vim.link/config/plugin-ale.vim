let g:ale_completion_enabled = 1

let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'css': ['prettier', 'stylelint'],
\   'html': ['prettier']
\}
