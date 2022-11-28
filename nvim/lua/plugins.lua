local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  -- Packer can managez itself
  use "wbthomason/packer.nvim"
  use "windwp/nvim-autopairs"
  use "goolord/alpha-nvim"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/everforest"
  use "mfussenegger/nvim-dap"
  use { "nvim-treesitter/nvim-treesitter" }
  use "nvim-treesitter/playground"
  use "gpanders/editorconfig.nvim"
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup() end
  }
  use { "nvim-telescope/telescope-project.nvim" }
  use { "nvim-telescope/telescope-dap.nvim" }
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require "telescope".load_extension("project")
      require("telescope").load_extension("dap")
    end
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() require("lualine").setup() end
  }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    }
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  -- cmp plugins
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/nvim-cmp", tag = "v0.0.1" } -- The completion plugin

  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup()
    end
  }

  use {
    "microsoft/vscode-js-debug",
    tag = "v1.72.1",
    opt = true,
    run = "npm install && npm run compile"
  }
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use "folke/lua-dev.nvim"
  use "b0o/SchemaStore.nvim"
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end
  }
  use {
    "akinsho/toggleterm.nvim"
  }
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest"
    }
  }
  use "terrortylor/nvim-comment"
  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons"
    }
  }

  use "jayp0521/mason-null-ls.nvim"

  use "APZelos/blamer.nvim"
  use "sitiom/nvim-numbertoggle"
end)
