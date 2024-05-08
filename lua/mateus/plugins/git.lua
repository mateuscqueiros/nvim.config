return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    event = "VeryLazy",
    config = function() vim.keymap.set("n", "<leader>gp", "<cmd>Git<CR>") end,
  },
}
