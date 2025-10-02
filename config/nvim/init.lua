if vim.g.vscode then
  -- no op for now
else
  require("remap")
  require("package-manager")
  require("telescope-config")
  require("settings")

  -- Defer non-essential configs
  vim.defer_fn(function()
    require("treesitter-config")
    require("dap-config")
    require("plugins")
    require("macros")
  end, 0)
end
