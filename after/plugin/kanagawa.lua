require('kanagawa').setup({
    colors = {
        palette = {
            -- change all usages of these colors
            fujiGray = "#94938b", -- changed for comments
            sumiInk4 = "#363646", -- changed for color col
            sumiInk6 = "#91919e"  -- changed for line num
        },
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                    bg_m3 = "none",
                    --bg_p1 = "none" --TODO: Change color column to lighter
                }
            }
        }
    },
    transparent = true,         -- do not set background color
    overrides = function(colors)
    local theme = colors.theme
    return {
        TelescopeTitle = { fg = theme.ui.fg, bold = true },
        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.m1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
    }
end,
})

SetColors()
