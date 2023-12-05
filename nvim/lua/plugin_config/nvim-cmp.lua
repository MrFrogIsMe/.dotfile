local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },
  -- 来源
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- For vsnip users.
    { name = 'vsnip' },
    -- For luasnip users.
    -- { name = 'luasnip' },
    --For ultisnips users.
    -- { name = 'ultisnips' },
    -- -- For snippy users.
    -- { name = 'snippy' },
  }, { { name = 'buffer' },
       { name = 'path' }
    }),

  -- 快捷键
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
          luasnip.jump(1)
      else
          fallback()
      end
    end, {'i', 's'}),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
          luasnip.jump(-1)
      else
          fallback()
      end
    end, {'i', 's'}),

    ['<C-.>'] = cmp.mapping.complete(),
    ['<C-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        Tabout(fallback)
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),


  -- 使用lspkind-nvim显示类型图标
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item
      end
    })
  },

  experimental = {
    ghost_text = true,
  },
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

function Tabout (fallback)
    local dict = {[')'] = 1, [']'] = 1, ['}'] = 1, ["'"] = 1, ['"'] = 1, [';'] = 1}
    --local currChar = vim.fn.getline('.')[vim.fn.col('.')-1]
    local line = vim.fn.getline('.')
    local currPos = vim.fn.col('.')
    local currChar = string.sub(line, currPos, currPos)
    if dict[currChar] then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Right>', true, true, true), 'i')
    else
        fallback()
    end
end
