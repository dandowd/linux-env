require("alpha").setup(require("welcome").config)
require("nvim_comment").setup()
require("neotest").setup({
  adapters = {
    require("neotest-jest")
  }
})
require("toggleterm").setup {
  direction = "float",
  hidden = "true",
  open_mapping = [[<c-t>]]
}
require("octo").setup()

-- require("nvim-tree").setup()

require("numbertoggle").setup()

require("mason-null-ls").setup()
require("nvim-autopairs").setup()
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
}
