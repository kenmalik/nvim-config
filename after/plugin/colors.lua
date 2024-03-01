function SetColors(color)
    color = color or "kanagawa-wave"
    vim.cmd.colorscheme(color)

--    vim.cmd [[hi StatusLine guibg=NONE]]
    vim.opt.signcolumn = "no"

end

