return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup({
        window = {
          width = 80,
          options = {},
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = false
      vim.wo.rnu = false
      vim.opt.colorcolumn = "0"
    end)
  end,
}
