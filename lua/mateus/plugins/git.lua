return {
  {
    'tanvirtin/vgit.nvim',
    branch = 'v1.0.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    cmd = 'VGit',
    config = function()
      require("vgit").setup({
        settings = {
          live_blame = {
            enabled = false,
          },
        }
      })
    end,
  }
}
