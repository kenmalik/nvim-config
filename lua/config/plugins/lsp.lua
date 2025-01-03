return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ts_ls", "gopls", "pyright" },
      handlers = {
        function(server_name)
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = capabilities
          })
        end,

        emmet_language_server = function()
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig").emmet_language_server.setup({
            filetypes = {
              "css",
              "eruby",
              "html",
              "javascript",
              "javascriptreact",
              "less",
              "sass",
              "scss",
              "pug",
              "typescriptreact",
              "templ",
            },
            capabilities = capabilities,
          })
        end,
      },
    },
  },
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
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end)
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
          end)
          vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
          end)
          vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
          end)
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
          end)
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
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
  }
}
