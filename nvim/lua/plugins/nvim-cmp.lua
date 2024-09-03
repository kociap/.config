return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local luasnip = require("luasnip")
    luasnip.setup({
      region_check_events = "CursorHold,InsertLeave,InsertEnter",
      delete_check_events = "TextChanged,InsertEnter",
    })

    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<ESC>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      completion = {
        -- See :h completeopt for more information.
        completeopt = "menu,menuone,preview,noselect",
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      enabled = function()
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        end
        -- Disable completion in comments.
        local context = require("cmp.config.context")
        local in_comment = context.in_treesitter_capture("comment")
          or context.in_syntax_group("Comment")
        return not in_comment
      end,
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
      },
    })
    -- Use buffer as source for '/' and '?'.
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })
    -- Use path and cmdline as source for ':'.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
