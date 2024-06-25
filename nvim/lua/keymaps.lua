local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-s-a>", ":wa<CR>", opts)
keymap("n", "<C-q>", ":wq<CR>", opts)
keymap("i", "<C-q>", "<ESC>:wq<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>a", opts)

-- Manage buffers
keymap("n", "<C-t>", ":enew<CR>", opts)
keymap("n", "<C-Tab>", ":bnext<CR>", opts)
keymap("n", "<C-S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
keymap("n", "<C-w>", ":bdelete<CR>", opts)

-- Manage splits
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>r", "<C-w>=", opts)

-- Navigate between 
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

--Toggle NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- Delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--Check or uncheck tasks in Markdown
keymap('n', '<leader>t', '^f[lrx$j', opts)
keymap('n', '<leader>u', '^f[lr $j', opts)
keymap('x', '<leader>t', ':normal! ^f[lrx$<CR>', opts)
keymap('x', '<leader>u', ':normal! ^f[lr $<CR>', opts)
