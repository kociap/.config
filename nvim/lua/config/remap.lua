vim.g.mapleader = " "

local map = vim.keymap.set

-- Move lines with J and K in visual mode.
map("v", "J", ":m '>+1<CR>gv")
map("v", "K", ":m '<-2<CR>gv")

-- Make d not copy text.
map("n", "d", '"_d')
map("v", "d", '"_d')

-- Make s not copy text.
map("n", "s", '"_s')
map("v", "s", '"_s')

-- Make C-d, C-u, C-f, C-b center the screen on the cursor.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

-- Window keymaps.
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>wx", "<CMD>q<CR>", { desc = "Close split" })

map("n", "<C-J>", "<C-w>j", { desc = "Move up" })
map("n", "<C-K>", "<C-w>k", { desc = "Move down" })
map("n", "<C-L>", "<C-w>l", { desc = "Move right" })
map("n", "<C-H>", "<C-w>h", { desc = "Move left" })

map("n", "<leader>we", "<C-w>=", { desc = "Equalise splits" })
map("n", "<leader>wrh", "<C-w><lt>", { desc = "Inc/Dec width" })
map("n", "<leader>wrl", "<C-w><gt>", { desc = "Inc/Dec width" })
map("n", "<leader>wrj", "<C-w>-", { desc = "Inc/Dec height" })
map("n", "<leader>wrk", "<C-w>+", { desc = "Inc/Dec height" })
