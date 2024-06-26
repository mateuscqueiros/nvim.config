return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  },
  {
    "https://git.sr.ht/~swaits/colorsaver.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      {
        "folke/tokyonight.nvim",
        priority = 1000,
        event = "VeryLazy",
        opts = {
          style = "night",
          transparent = true,
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
        "rose-pine/neovim",
        config = function()
          require("rose-pine").setup({
            styles = {
              transparency = true,
            },
          })
        end,
      },
      { "AlexvZyl/nordic.nvim" },
      { "EdenEast/nightfox.nvim" },
      { "Shatur/neovim-ayu" },
      { "rebelot/kanagawa.nvim" },
      { "ellisonleao/gruvbox.nvim" },
      { "Alexis12119/nightly.nvim" },
      { "catppuccin/nvim" },
      { "Shatur/neovim-ayu" },
      {
        "nyoom-engineering/oxocarbon.nvim",
        event = "VeryLazy",
        config = function()
          vim.cmd("colorscheme oxocarbon")
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
      },
    },
  },
}
