vim.g.ale_completion_enabled = 1
vim.g.ale_fix_on_save = 1

vim.g.ale_fixers = {
    javascript = {'prettier'},
    javascriptreact = {'prettier'},
    typescript = {'prettier'},
    typescriptreact = {'prettier'},
    json = {'prettier'},
    yaml = {'prettier'},
    css = {'prettier', 'stylelint'},
    html = {'prettier'}
}

