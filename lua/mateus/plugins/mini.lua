return {
  {
    "echasnovski/mini.files",
    version = "*",
    lazy = false,
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        options = {
          permanent_delete = false,
        },
        mappings = {
          go_in_plus = "l",
          go_in = "L",
        },
        windows = {
          width_focus = 30,
        },
      })

      vim.keymap.set("n", "<leader>o", function()
        MiniFiles.open()
      end)
    end,
  },
}
