return {
  -- { "vimpostor/vim-tpipeline" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        lualine_c = {
          -- {
          --   "harpoon2",
          -- },
          {
            "filename",
            file_status = true,
            path = 4,
          },
        },
      },
      options = {
        globalstatus = true,
        component_separators = "",
        section_separators = "",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
