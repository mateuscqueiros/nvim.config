return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local default_theme = { fg = "NONE", bg = "NONE" }

    lualine.setup({
      sections = {
        lualine_a = { "branch", "diff" },
        lualine_b = {},
        lualine_c = {
          "%=",
          {
            "filename",
            path = 4,
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

    vim.cmd([[
      hi StatusLine guibg=NONE ctermbg=NONE
      hi StatusLineNC guibg=NONE ctermbg=NONE
    ]])

    vim.opt.fillchars = {
      stl = "─",
      stlnc = "─",
    }
  end,
}
