require("nvim-treesitter.configs").setup({
  ensure_installed = { "typescript", "javascript", "lua", "yaml", "jsdoc" },
  auto_install = true,
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
  }
})
