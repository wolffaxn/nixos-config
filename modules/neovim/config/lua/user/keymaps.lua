local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.keymap.set

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- toggle filebrowser
keymap({'n', 'i', 'v'}, '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

-- save
keymap("n", "<leader>w", ":write<CR>", opts)
