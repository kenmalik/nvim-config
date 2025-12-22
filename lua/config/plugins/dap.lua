return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {},
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			local adapter_path = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/debugpy-adapter"
			require("dap-python").setup(adapter_path)
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
}
