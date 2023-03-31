local opt = vim.opt

-- Disbale vi compatibility mode
opt.compatible = false

-- Show line numbers
opt.number = true

-- Enables a distinct line at the position of the cursor
opt.cursorline = true

-- Show a column at the specified width for the preferred line width
opt.colorcolumn = '121'

opt.linespace = 5
opt.scrolloff = 10

opt.listchars = "tab:»-,trail:·,extends:»,precedes:«"
opt.list = true

opt.title = true

opt.splitbelow = true
opt.splitright = true

opt.updatetime = 100

-- Allow unsaved buffers in the background
opt.hidden = true

-- Set the current directory to the directory of the active buffer
-- opt.autochdir = true

-- Prefer a unix file-type
opt.ffs = "unix,dos,mac"

-- Disable swap files
opt.writebackup = false
opt.swapfile = false
opt.backup = false

-- Fold settings
opt.foldmethod = "syntax"
opt.foldlevelstart = 99

-- Highlight matching parens
opt.showmatch = true

-- Indentation Settings

opt.autoindent = true
opt.copyindent = true
opt.smartindent = true
opt.smarttab = true

--- Tab characters will be 4 spaces wide
opt.softtabstop=4
opt.shiftwidth=4
opt.tabstop=4
opt.shiftround = true

--- Use spaces instead of tabs
opt.expandtab = true

--- Don't indent when commenting out a line
vim.cmd[[
set indentkeys-=0#
]]

-- Search settings

--- Disable case-sensitivity in searches if there isn't
--- an uppercase letter in the pattern
opt.ignorecase = true
opt.smartcase = true

--- Search and highlight as you type
opt.incsearch = true
opt.showmatch = true
opt.hlsearch = true

opt.magic = true

-- Statusline settings

--- Always show the statusline
opt.laststatus = 3

--- Show the current row and column coordinates of the cursor in the statusline
opt.ruler = true


-- Install & configure plugins

require('aloop.bootstrap.plugins')
