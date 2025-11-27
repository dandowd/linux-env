local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opt = {
      enabled = false
    }
  },
	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
	},
	"nvim-lua/plenary.nvim",
	{
		"leoluz/nvim-dap-go",
		ft = "go",
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, lazy = false },
	{
		"sbdchd/neoformat",
		cmd = "Neoformat",
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		"microsoft/vscode-js-debug",
		-- tag = "v1.102.0",
		opt = true,
		build = "npm install --legacy-peer-deps && npx gulp dapDebugServer && mv dist out",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "Neotree" },
		keys = {
			{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neotree" },
		},
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
	},
	{
		"b0o/schemastore.nvim",
		ft = "json",
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf", lazy = false, priority = 1000 },
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"folke/neodev.nvim",
		ft = "lua",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-neotest/neotest-jest", commit = "797515e" },
		},
		cmd = { "Neotest" },
		ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest"),
				},
				output = {
					enable = false,
					open_on_run = false,
				},
				quickfix = {
					enable = false,
					open = false,
				},
				output_panel = {
					enable = false,
					open = false,
				},
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		},
		config = function()
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		event = "VeryLazy",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				accept = {
					auto_brackets = { enabled = false },
				},
				documentation = { auto_show = false },
				menu = {
					draw = {
						columns = {
							{ "label", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
							{ "source_name" },
							{ "label_description" },
						},
					},
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			signature = { enabled = true },

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"olimorris/codecompanion.nvim",
		cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
})

--require("project_nvim").setup({})
--require("telescope").load_extension("projects")

-- This must come before lsp config
require("neoconf").setup({})
