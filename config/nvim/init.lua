require("package-manager")
require("settings")
require("remap")

-- Defer non-essential configs
vim.defer_fn(function()
	require("treesitter-config")
	require("telescope-config") 
	require("dap-config")
	require("plugins")
	require("macros")
end, 0)
