return {
  {
    "LazyVim/LazyVim",
    lazy = false,
    opts = {
      colorscheme = "tokyonight",
    },
  },
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
  -- Other themes
  {
    "ellisonleao/gruvbox.nvim",
    "Alexis12119/nightly.nvim",
    "rose-pine/neovim",
    "catppuccin/nvim",
  },
}
