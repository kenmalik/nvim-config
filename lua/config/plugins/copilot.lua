return {
	"github/copilot.vim",
	keys = {
		{
			"<leader>cp",
			function()
				local status = vim.api.nvim_exec2("Copilot status", { output = true }).output
				local enabled = string.find(status, "Ready") ~= nil
				if enabled then
					vim.cmd("Copilot disable")
          print("Copilot disabled")
				else
					vim.cmd("Copilot enable")
          print("Copilot enabled")
				end
			end,
		},
	},
}
