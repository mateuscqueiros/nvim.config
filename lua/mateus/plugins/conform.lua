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
        vue = { "prettier" },
        lua = { "lua_ls" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
      },
      format_on_save = {
        timeout_ms = 200,
        lsp_fallback = true,
      },
    })

    vim.keymap.set("n", "<leader>fp", organize_imports)

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        conform.format({ bufnr = args.buf })
      end,
    })
  end,
}
