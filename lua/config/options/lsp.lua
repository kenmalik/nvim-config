vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--query-driver=/usr/bin/c++,/usr/bin/g++,/usr/bin/clang++",
		"--compile-commands-dir=build",
	},
})

vim.lsp.config("pyright", {})

vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("typescript-language-server")
