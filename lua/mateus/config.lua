vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.wo.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Providers legados custam centenas de ms ao abrir arquivos (ex.: python)
for _, provider in ipairs({ "python3", "ruby", "perl", "node" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.opt.termguicolors = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.ttimeoutlen = 5 -- padrão é 50 ms de atraso ao apertar Esc

vim.g.terminal_emulator = "tmux"
vim.opt.fillchars = {
  vert = " ",
}

vim.diagnostic.config({
  virtual_lines = false,
  underline = true,
  virtual_text = {
    spacing = 5,
    severity = vim.diagnostic.severity.WARN,
  },
  update_in_insert = true,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.fn.timer_start(5000, function()
      vim.cmd('echom ""')
    end)
  end,
})
