return {
  "catgoose/nvim-colorizer.lua",
  event = "VeryLazy",
  opts = {
    filetypes = { "*" },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      names = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      tailwind = true,
      sass = { enable = true },
    },
  },
}
