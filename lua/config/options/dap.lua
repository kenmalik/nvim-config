local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "<Leader>b", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>cb", function()
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
end

dap.listeners.before["event_terminated"]["keymaps"] = function()
	vim.keymap.del("n", "<Down>")
	vim.keymap.del("n", "<Right>")
	vim.keymap.del("n", "<Left>")
	vim.keymap.del("n", "<Up>")
end

dap.listeners.before["event_process"]["dapui"] = function()
	dapui.open()
end
vim.keymap.set("n", "<Leader>dui", function() dapui.toggle() end)

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/Users/kenmalik/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
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
