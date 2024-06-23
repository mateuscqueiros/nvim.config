return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local default_theme = { fg = "#ebbcba", bg = "None" }

    lualine.setup({
      sections = {
        lualine_a = { "branch", "diff", "diagnostics" },
        lualine_b = {},
        lualine_c = {
          "%=",
          {
            "filename",
          },
        },
        lualine_x = {},
        lualine_y = { "diagnostics", "searchcount" },
      },
      options = {
        theme = {
          normal = {
            a = default_theme,
            b = default_theme,
            c = default_theme,
            y = default_theme,
            x = default_theme,
          },
          inactive = {
            a = default_theme,
            b = default_theme,
            c = default_theme,
            y = default_theme,
            x = default_theme,
          },
        },
        globalstatus = true,
        component_separators = "",
        section_separators = "",
      },
    })

    vim.opt.fillchars = {
      stl = "─",
      stlnc = "─",
    }
  end,
}
--
-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = {
--       sections = {
--         lualine_c = {
--           {
--             "filename",
--             file_status = true,
--             path = 4,
--           },
--         },
--       },
--       options = {
--         globalstatus = true,
--         component_separators = "",
--         section_separators = "",
--       },
--     },
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--   },
-- }
