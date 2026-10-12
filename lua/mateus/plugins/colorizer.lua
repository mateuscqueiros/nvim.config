return {
  "catgoose/nvim-colorizer.lua",
  event = "VeryLazy",
  opts = {
    filetypes = { "*" },
    options = {
      parsers = {
        css = true,
        hex = { rrggbbaa = true },
        tailwind = { enable = true },
        sass = { enable = true },
      },
    },
  },
}
