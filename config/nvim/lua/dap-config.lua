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
    name = "Solace Health Server2",
    type = "pwa-node",
    request = "launch",
    runtimeExecutable = "npm",
    runtimeArgs = { "run", "dev" },
    cwd = vim.fn.getcwd(),
    console = "integratedTerminal",   -- behaves like VS Code's
    internalConsoleOptions = "neverOpen",
  },
  {
		type = "pwa-node",
		request = "launch",
		name = "Launch node",
		cwd = "${workspaceFolder}",
    runtimeExecutable = "npm",
    runtimeArgs = {"run", "dev"},
  },
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
    restart = true
	},
  {
    type = 'pwa-node', -- or 'pwa-chrome' for browser debugging
    request = 'attach',
    name = 'Attach to Remote Node.js',
    hostName = '127.0.0.1', -- or the IP address of your remote machine/container
    port = 9229, -- The port your Node.js app is listening on
    cwd = vim.fn.getcwd(), -- Current working directory for source mapping
    restart = true
  }
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
