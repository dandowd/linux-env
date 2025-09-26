if vim.g.vscode then
  -- no op for now
else
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
end
