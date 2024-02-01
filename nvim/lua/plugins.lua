return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  --use 'morhetz/gruvbox'
  use 'joshdick/onedark.vim'
  use 'xiyaowong/transparent.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '*',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax Highlight
  use 'nvim-treesitter/nvim-treesitter'

  -- Sidebars
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'stevearc/aerial.nvim'
  -- use 'simrat39/symbols-outline.nvim'


  -- Lines
  use 'nvim-lualine/lualine.nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  --use 'kdheepak/tabline.nvim'
  --use 'bfrg/vim-cpp-modern'
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'

  -- Pair
  use 'jiangmiao/auto-pairs'
  use 'windwp/nvim-ts-autotag'
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'

  use 'neovim/nvim-lsp'
  use 'neovim/nvim-lspconfig'

  -- Formater
  use 'nvim-lua/plenary.nvim'
  use 'nvimtools/none-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- AI auto-complete
 	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  --use { 'neoclide/coc.nvim', branch = 'release' }

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
  -- luasnip
  use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'

  -- lspkind
  use 'onsails/lspkind-nvim'

  -- indent
  --use "lukas-reineke/indent-blankline.nvim"

  -- Markdow
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


end)
