return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}

-- return {
--   "numToStr/Comment.nvim",
--   event = "VeryLazy",
--   config = function()
--     require("Comment").setup({
--       pre_hook = function()
--         return vim.bo.commentstring
--       end,
--     })
--   end,
--   dependencies = {
--     "JoosepAlviste/nvim-ts-context-commentstring",
--     "nvim-treesitter/nvim-treesitter",
--   },
-- }
