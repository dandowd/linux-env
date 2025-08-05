local dap = require("dap")

dap.configurations.logLevel = "error"

dap.adapters.coreclr = {
	type = "executable",
	command = vim.fn.expand("~/.local/share/nvim/mason/packages/netcoredbg/netcoredbg"),
	args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = {
	type = "executable",
	command = vim.fn.expand("~/.local/share/nvim/mason/packages/netcoredbg/netcoredbg"),
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		name = "Launch",
		type = "coreclr",
		request = "launch",
		program = "${workspaceFolder}/bin/Debug/",
		args = {},
		preLaunchTask = "build",
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		justMyCode = true,
	},
}

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = { vim.fn.expand("~/.local/share/nvim/lazy/vscode-js-debug/out/src/dapDebugServer.js"), "${port}" },
	},
}
dap.configurations.typescript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		processId = require("dap.utils").pick_process,
		protocol = "inspector",
		cwd = "${workspaceFolder}",
	},
}

dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		processId = require("dap.utils").pick_process,
		protocol = "inspector",
		cwd = "${workspaceFolder}",
	},
}

require("dapui").setup()
