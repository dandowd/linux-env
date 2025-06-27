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
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-lua/plenary.nvim",
	"leoluz/nvim-dap-go",
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	"sbdchd/neoformat",
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		"microsoft/vscode-js-debug",
		opt = true,
		build = "npm install --legacy-peer-deps && npx gulp dapDebugServer && mv dist out",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{ "ahmedkhalf/project.nvim" },
	{ "b0o/schemastore.nvim" },
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/trouble.nvim",
	"folke/neodev.nvim",
	"nvim-treesitter/nvim-treesitter",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"rcarriga/nvim-dap-ui",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
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
	"nvim-tree/nvim-web-devicons",
	{ "nvim-telescope/telescope.nvim" },
	"nvim-lualine/lualine.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"windwp/nvim-autopairs",
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
})

--require("project_nvim").setup({})
--require("telescope").load_extension("projects")

-- This must come before lsp config
require("neoconf").setup({})

local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	suggest_lsp_servers = false,
})

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			--require("cmp-under-comparator").under,
			cmp.config.compare.kind,
		},
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping.abort(),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

require("mason").setup()
require("mason-lspconfig").setup()

local json_capabilities = vim.lsp.protocol.make_client_capabilities()
json_capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").jsonls.setup({
	capabilities = json_capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lsp.setup()

require("lualine").setup()
require("trouble").setup()

require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
require("nvim-autopairs").setup()

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		indicator = {
			style = "underline",
		},
		separator_style = "padded_slant",
		sort_by = "directory",
	},
})
