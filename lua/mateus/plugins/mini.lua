return {
  {
    "echasnovski/mini.files",
    version = "*",
    lazy = false,
    config = function()
      local mini = require("mini.files")
      mini.setup({
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

      vim.keymap.set(
        "n",
        "-",
        "<CMD>Oil<CR>",
        { desc = "Open parent directory" }
      )

      vim.keymap.set("n", "<leader>o", function() mini.open() end)
    end,
  },
}
