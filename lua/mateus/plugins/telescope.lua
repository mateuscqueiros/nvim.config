return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local commands = require("mateus.commands")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--max-filesize", "1M",
        },
        path_display = { "truncate" },
        file_ignore_patterns = {
          "node%_modules/.*",
          "lazy%-lock.json",
          "package%-lock.json",
          ".git/.*",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.cycle_history_prev,
            ["<C-k>"] = actions.cycle_history_next,
          },
        },
      },
      pickers = {
        defaults = {
          enable_preview = true,
          cache_picker = {
            num_pickers = 4,
            limit_entries = 20,
          },
        },
        find_files = {
          hidden = true,
        },
      },
    })

    local TelescopeColor = {
      TelescopeSelection = {
        fg = "#B38600",
        bold = true,
      },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    vim.keymap.set("n", "<leader>fr", function()
      builtin.resume()
    end)

    vim.keymap.set("n", "<leader>ff", function()
      builtin.fd()
    end)
    vim.keymap.set("n", "<leader>fg", function()
      builtin.live_grep({
        additional_args = function()
          return { "--fixed-strings" }
        end,
      })
    end)
    vim.keymap.set("n", "<leader>fb", function()
      builtin.buffers(commands.no_preview())
    end)
    vim.keymap.set("n", "<leader>fh", function()
      builtin.help_tags(commands.no_preview())
    end)
    vim.keymap.set("n", "<leader>fc", function()
      builtin.colorscheme({
        enable_preview = true,
      })
    end)
  end,
}
