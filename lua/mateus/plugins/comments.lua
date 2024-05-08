return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
  },
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup({
      pre_hook = function() return vim.bo.commentstring end,
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
