---@module "lazy"
---@type LazySpec
return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = "*",
  event = { 'InsertEnter', 'CmdlineEnter' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    fuzzy = {
      implementation = "prefer_rust_with_warning"
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'normal',
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },
      --[[ documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        update_delay_ms = 50,
        treesitter_highlighting = true,
        window = { border = 'rounded' },
      },]] --
      documentation = {
        auto_show = false
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        window = { border = 'rounded' },
        draw = {
          padding = { 0, 1 }, -- padding only on right side
          components = {
            kind_icon = {
              text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
            }
          }
        }
      },
    },

    keymap = {
      -- Completion actions
      ['<C-space>'] = { 'show', 'show', 'hide' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      -- Navigation in list
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      -- Scroll docs
      ['<C-up>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-down>'] = { 'scroll_documentation_down', 'fallback' },

      -- Super-Tab + snippet navigation
      ['<Tab>'] = {
        function(cmp) return cmp.select_next() end,
        'snippet_forward',
        'fallback',
      },
      ['<S-Tab>'] = {
        function(cmp) return cmp.select_prev() end,
        'snippet_backward',
        'fallback',
      },

      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
    },

    signature = {
      enabled = true,
      window = { border = 'rounded' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lsp = { min_keyword_length = 2, score_offset = 0 },
        path = { min_keyword_length = 0 },
        snippets = { min_keyword_length = 2 },
        buffer = { min_keyword_length = 4, max_items = 5 },
      },
    },
  },
}
