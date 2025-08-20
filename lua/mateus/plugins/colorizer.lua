return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  config = function()
    require("colorizer").setup({
      "*",             -- habilita para todos os arquivos
    }, {
      RGB = true,      -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      names = true,    -- "Name" colors like Blue or blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true,   -- CSS rgb() and rgba() functions
      hsl_fn = true,   -- CSS hsl() and hsla() functions
      css = true,      -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true,   -- Enable all css *functions*: rgb_fn, hsl_fn
    })

    vim.cmd("ColorizerAttachToBuffer")
  end,
}
