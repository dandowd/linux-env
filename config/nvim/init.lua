if vim.g.vscode then
  require("remap")
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
