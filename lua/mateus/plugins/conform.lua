return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local conform = require("conform")
    local organize_imports = require("mateus.commands").organize_imports

    conform.setup({
      formatters_by_ft = {
        lua = { "lua_ls" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })

    vim.keymap.set("n", "<leader>fp", organize_imports)

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        conform.format({ bufnr = args.buf })

        organize_imports()
      end,
    })
  end,
}
