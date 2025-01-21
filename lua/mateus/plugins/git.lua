return {
  {
    "sindrets/diffview.nvim",
    config = function()
      local diffview = require("diffview").setup({})
      vim.keymap.set("n", "<leader>df", "<cmd>DiffviewOpe<CR>")
      vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>")
      vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>")
    end,
  },
  {
    "tpope/vim-fugitive",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>gp", "<cmd>Git<CR>")
    end,
  },
}
