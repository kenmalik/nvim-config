return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function()
                    vim.keymap.set("n", "gd", function()
                        vim.lsp.buf.definition()
                    end)
                    vim.keymap.set("n", "<leader>vws", function()
                        vim.lsp.buf.workspace_symbol()
                    end)
                    vim.keymap.set("n", "<leader>vd", function()
                        vim.diagnostic.open_float()
                    end)
                    vim.keymap.set("n", "<leader>vca", function()
                        vim.lsp.buf.code_action()
                    end)
                    vim.keymap.set("n", "<leader>vrr", function()
                        vim.lsp.buf.references()
                    end)
                    vim.keymap.set("n", "<leader>vrn", function()
                        vim.lsp.buf.rename()
                    end)
                    vim.keymap.set("i", "<C-h>", function()
                        vim.lsp.buf.signature_help()
                    end)

                    vim.keymap.set({ "n", "x" }, "gq", function()
                        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                    end)
                end,
            })
        end,
    },
}
