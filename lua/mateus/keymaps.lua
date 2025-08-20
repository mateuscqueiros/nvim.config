local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Do things without changing register
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>p", '"0p')
keymap.set("n", "<leader>P", '"0P')
keymap.set("v", "<leader>p", '"0p')
keymap.set("n", "<leader>c", '"_c')
keymap.set("n", "<leader>C", '"_C')
keymap.set("v", "<leader>c", '"_c')
keymap.set("v", "<leader>C", '"_C')
keymap.set("n", "<leader>d", '"_d')
keymap.set("n", "<leader>D", '"_D')
keymap.set("v", "<leader>d", '"_d')
keymap.set("v", "<leader>D", '"_D')
keymap.set("v", "<leader>y", '"+y')

-- Move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center when jumping
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split window
keymap.set("n", "<leader>s", ":split<Return>", opts)
keymap.set("n", "<leader>v", ":vsplit<Return>", opts)

-- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Utils
keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "q", "<cmd>cclose<CR>", {})
keymap.set("n", "mq", "q", {})

-- LSP
keymap.set("n", "<leader>m", "<cmd>Mason<CR>", {})
keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", {})
keymap.set("n", "<leader>cc", "<cmd>Conform<CR>", {})
