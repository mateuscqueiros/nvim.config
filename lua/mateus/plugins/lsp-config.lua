return {
  {
    "williamboman/mason.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "j-hui/fidget.nvim",
      "williamboman/mason.nvim",
    },
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "html",
        "cssls",
        -- "gopls",
        "tailwindcss",
        "somesass_ls",
        "pyright",
        "clangd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspRestart" },
    dependencies = {
      "j-hui/fidget.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lsp_config = require("lspconfig")

      local organize_imports = require("mateus.commands").organize_imports
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function()
        local buf = vim.lsp.buf
        vim.keymap.set("n", "<leader>rn", buf.rename, {})
        vim.keymap.set("n", "<leader>ca", buf.code_action, {})
        vim.keymap.set("n", "gd", buf.definition, {})
        vim.keymap.set("n", "gi", buf.implementation, {})
        vim.keymap.set("n", "<leader>rs", function()
          print(vim.inspect(vim.lsp.get_active_clients()))
          vim.cmd("LspRestart")
        end, {})
        vim.keymap.set(
          "n",
          "gr",
          require("telescope.builtin").lsp_references,
          {}
        )
        vim.keymap.set(
          "n",
          "gr",
          require("telescope.builtin").lsp_references,
          {}
        )
        vim.keymap.set("n", "K", buf.hover, {})
      end

      -- Signs
      vim.fn.sign_define(
        "DiagnosticSignError",
        { text = "", texthl = "DiagnosticSignError" }
      )
      vim.fn.sign_define(
        "DiagnosticSignWarn",
        { text = "", texthl = "DiagnosticSignWarn" }
      )
      vim.fn.sign_define(
        "DiagnosticSignInfo",
        { text = "", texthl = "DiagnosticSignInfo" }
      )
      vim.fn.sign_define(
        "DiagnosticSignHint",
        { text = "", texthl = "DiagnosticSignHint" }
      )

      -- LSPs setup
      lsp_config.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnipet = "Replace",
            },
          },
        },
      })

      -- lsp_config.gopls.setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- })

      lsp_config.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        commands = {
          FixImp = {
            organize_imports,
            description = "Organize imports",
          },
        },
      })

      lsp_config.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp_config.cssls.setup({
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp_config.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp_config.somesass_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp_config.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lsp_config.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
