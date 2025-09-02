require('lspconfig').clangd.setup{
  cmd = {
    "clangd",
    "--query-driver=/usr/bin/c++,/usr/bin/g++,/usr/bin/clang++",
    "--compile-commands-dir=build",
  },
}

vim.lsp.enable("clangd")
