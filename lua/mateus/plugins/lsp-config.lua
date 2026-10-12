return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            completion = { callSnippet = "Replace" },
            telemetry = { enable = false },
          },
        },
      })

      local unknown_at_rules = {
        validate = true,
        lint = { unknownAtRules = "ignore" },
      }
      vim.lsp.config("cssls", {
        settings = {
          css = unknown_at_rules,
          scss = unknown_at_rules,
          less = unknown_at_rules,
        },
      })

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = vim.lsp.buf
          local function map(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf })
          end
          map("<leader>rn", buf.rename)
          map("<leader>ca", buf.code_action)
          map("gd", buf.definition)
          map("gi", buf.implementation)
          map("gr", function()
            require("telescope.builtin").lsp_references()
          end)
          map("K", buf.hover)
          map("<leader>lsp", "<cmd>LspRestart<CR>")
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "somesass_ls",
          "pyright",
          "clangd",
        },
        automatic_enable = true,
      })
    end,
  },
}
