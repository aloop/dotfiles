require('lualine').setup {
    options = {
        theme = 'auto',
        disabled_filetypes = {
            winbar = {
                'help',
                'dashboard',
                'NvimTree',
                'packer',
            }
        }
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    -- winbar = {
    --     lualine_a = {'filename'},
    --     lualine_b = {'branch'},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
    -- inactive_winbar = {
    --     lualine_a = {'filename'},
    --     lualine_b = {'branch'},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {}
    -- }
}
