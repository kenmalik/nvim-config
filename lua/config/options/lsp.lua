vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--query-driver=/usr/bin/c++,/usr/bin/g++,/usr/bin/clang++",
		"--compile-commands-dir=build",
	},
})
vim.lsp.enable("clangd")

vim.lsp.config("pyright", {})
vim.lsp.enable("pyright")

vim.lsp.config("typescript-language-server", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact" },
})
vim.lsp.enable("typescript-language-server")

vim.lsp.config("emmet_language_server", {})
vim.lsp.enable("emmet_language_server")

vim.lsp.config("jdtls", {})
vim.lsp.enable("jdtls")

vim.lsp.config("cmake-language-server", {
    command = { "cmake-language-server" },
    filetypes = { "cmake" },
})
vim.lsp.enable("cmake-language-server")
