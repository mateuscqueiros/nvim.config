return {
  {
    "tpope/vim-surround",
    event = "InsertEnter",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = {
            spacing = 5,
            severity_limit = "Warning",
          },
          update_in_insert = true,
        })

      require("nvim-ts-autotag").setup()
    end,
  },
}
