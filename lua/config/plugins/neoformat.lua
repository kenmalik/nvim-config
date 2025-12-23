return {
	"sbdchd/neoformat",
	config = function()
		vim.keymap.set("n", "<Leader>fm", "<Cmd>Neoformat<CR>")
	end,
}
