local dap = require("dap")

dap.configurations.logLevel = "error"

dap.adapters.coreclr = {
	type = "executable",
	command = "/usr/local/netcoredbg/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = {
	type = "executable",
	command = "/usr/local/netcoredbg/netcoredbg",
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

require("dapui").setup()
