return {
  "supermaven-inc/supermaven-nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("supermaven-nvim").setup({})
  end,
}
