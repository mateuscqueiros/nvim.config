return {
  -- tell LazyVim to stop messing with colorschemes
  { "catppuccin/nvim",       name = "catppuccin", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine", -- just some random built-in scheme
    },
  },

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
      { "AlexvZyl/nordic.nvim" },
      { "EdenEast/nightfox.nvim" },
      { "Shatur/neovim-ayu" },
      { "rebelot/kanagawa.nvim" },
      { "ellisonleao/gruvbox.nvim" },
      { "Alexis12119/nightly.nvim" },
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
      { "catppuccin/nvim" },
      { "Shatur/neovim-ayu" },
    },
  },
}
