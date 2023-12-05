return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use 'joshdick/onedark.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'nvim-lualine/lualine.nvim'
  --use 'kdheepak/tabline.nvim'
  --use 'bfrg/vim-cpp-modern'
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  --use { 'neoclide/coc.nvim', branch = 'release' }
  use 'jiangmiao/auto-pairs'

  use 'neovim/nvim-lsp'
  use 'neovim/nvim-lspconfig'

  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'

  -- indent
  use "lukas-reineke/indent-blankline.nvim"


  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


end)
