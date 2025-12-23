local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "<Leader>b", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>C", function()
	dap.set_breakpoint(vim.fn.input("Condition: "), nil, nil)
end)
vim.keymap.set("n", "<Leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>c", function()
	dap.continue()
end)
dap.listeners.before["event_process"]["keymaps"] = function()
	vim.keymap.set("n", "<Down>", function()
		dap.step_over()
	end)
	vim.keymap.set("n", "<Right>", function()
		dap.step_into()
	end)
	vim.keymap.set("n", "<Left>", function()
		dap.step_out()
	end)
	vim.keymap.set("n", "<Up>", function()
		dap.restart_frame()
	end)
	vim.keymap.set("n", "<Leader>dr", function()
		dap.restart()
	end)
end

dap.listeners.before["event_terminated"]["keymaps"] = function()
	vim.keymap.del("n", "<Down>")
	vim.keymap.del("n", "<Right>")
	vim.keymap.del("n", "<Left>")
	vim.keymap.del("n", "<Up>")
	vim.keymap.del("n", "<Leader>dr")
end

dap.listeners.before["event_process"]["dapui"] = function()
	dapui.open()
end
vim.keymap.set("n", "<Leader>dui", function()
	dapui.toggle()
end)

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch an executable",
		type = "cppdbg",
		request = "launch",
		cwd = "${workspaceFolder}",
		program = function()
			return coroutine.create(function(coro)
				local opts = {}
				pickers
					.new(opts, {
						prompt_title = "Path to executable",
						finder = finders.new_oneshot_job({ "fdfind", "--hidden", "--no-ignore", "--type", "x" }, {}),
						sorter = conf.generic_sorter(opts),
						attach_mappings = function(buffer_number)
							actions.select_default:replace(function()
								actions.close(buffer_number)
								coroutine.resume(coro, action_state.get_selected_entry()[1])
							end)
							return true
						end,
					})
					:find()
			end)
		end,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
