local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
local actions = require("telescope.actions")

local find_command = {
	"rg",
	"--files",
  "--glob",
  "**/*",
  "--glob",
  ".env",
  "--glob",
  "!.git",
  "--glob",
  "!.venv",
  "--glob",
  "!node_modules",
  "--glob",
  "!__pycache__",
  "--glob",
  "!dist",
}

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		find_command = find_command,
	})
end, {})
vim.keymap.set("n", "<leader>fp", extensions.projects.projects, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ft", builtin.buffers, {})
vim.keymap.set("n", "<leader>fr", builtin.registers, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true }
)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files({
				find_command = find_command,
			})
		end
	end,
})

require("telescope").setup({
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-d>"] = actions.delete_buffer, -- delete buffer in insert mode
      },
      n = {
        ["<C-d>"] = actions.delete_buffer, -- delete buffer in normal mode
      },
    },
  },
})
