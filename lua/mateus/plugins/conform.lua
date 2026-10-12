return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo", "Conform" },
  keys = {
    {
      "<leader>fp",
      function()
        require("mateus.commands").organize_imports()
      end,
    },
  },
  opts = {
    formatters_by_ft = {
      vue = { "prettier" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd" },
      css = { "prettierd" },
      json = { "prettierd" },
    },
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  },
}
