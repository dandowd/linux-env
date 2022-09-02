return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'EdenEast/nightfox.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use { 
    'folke/which-key.nvim',
    config = function () require('which-key').setup() end
  }
  use { 'nvim-telescope/telescope-project.nvim' }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function () require'telescope'.load_extension('project') end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function () require('lualine').setup() end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function () require('nvim-tree').setup() end,
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
end)
