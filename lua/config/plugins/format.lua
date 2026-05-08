return {
    "stevearc/conform.nvim",
    opts = {
        lua = { "stylua" },
        python = { "ruff" },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
