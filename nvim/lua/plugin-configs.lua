require 'alpha'.setup(require 'welcome'.config)
require 'nvim_comment'.setup()
require 'neotest'.setup({
  adapters = {
    require("neotest-jest")
  }
})
require("toggleterm").setup {
  direction = "float",
  hidden = "true",
  open_mapping = [[<c-t>]]
}
