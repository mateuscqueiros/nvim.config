return {
  -- load/save our last used colorscheme automatically
  {
    "https://git.sr.ht/~swaits/colorsaver.nvim",
    event = "VimEnter",
    opts = {},
    dependencies = {
      -- load colorschemes as a dependency of colorsaver
      {
        "folke/tokyonight.nvim",
        priority = 1000,
        event = "VeryLazy",
        opts = {
          style = "night",
        },
      },
      {
        "craftzdog/solarized-osaka.nvim",
        event = "VeryLazy",
        priority = 1000,
        opts = {
          transparent = false,
        },
      },
      {
        "ellisonleao/gruvbox.nvim",
        config = function()
          require("gruvbox").setup({
            transparent_mode = true,
          })
        end
      },
      {
        "rose-pine/neovim",
        config = function()
          require("rose-pine").setup({
            variant = "moon",
            styles = {
              transparency = true,
              italic = false
            },
            before_highlight = function(group, highlight, palette)
              vim.api.nvim_set_hl(0, '@lsp.type.property.typescript', { fg = palette.pink })
              vim.api.nvim_set_hl(0, '@lsp.type.property.typescriptreact', { fg = palette.pink })
            end
          })
        end,
      },
    },
  },
}
