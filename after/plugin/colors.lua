function SetColors(color)
    color = color or "kanagawa-wave"
    -- color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    require 'colorizer'.setup({
        filetypes = {
            '*',
            '!cmp_menu', -- Disable highlighting in cmp menu
        },
        user_default_options = {
            tailwind = true,
            mode = "background",
        }
    })

    -- vim.opt.signcolumn = "no"
end
