if vim.g.vscode then
  -- no op for now
else
  require("package-manager")
  require("telescope-config")
  require("settings")
  require("remap")

  -- Defer non-essential configs
  vim.defer_fn(function()
    require("treesitter-config")
    require("dap-config")
    require("plugins")
    require("macros")
  end, 0)
end
