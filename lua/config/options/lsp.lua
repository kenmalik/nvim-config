vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--query-driver=/usr/bin/c++,/usr/bin/g++,/usr/bin/clang++",
		"--compile-commands-dir=build",
	},
})

vim.lsp.config("typescript-language-server", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact" },
})

vim.lsp.config("cmake-language-server", {
	command = { "cmake-language-server" },
	filetypes = { "cmake" },
})
