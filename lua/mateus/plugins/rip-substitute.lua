return {
  "chrisgrieser/nvim-rip-substitute",
  keys = {
    {
      "<leader>fs",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = "Replace",
    },
  },
}
