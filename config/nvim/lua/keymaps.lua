local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("n", "<Leader>.", ":e ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<ESC><ESC>", ":nohlsearch<CR><ESC>", opts)
keymap("n", "<M-h>", ":bprev<CR>", opts)
keymap("n", "<M-l>", ":bnext<CR>", opts)
keymap("n", "<M-w>", ":bd<CR>", opts)
keymap("n", "<Leader>l", ":bnext<CR>", opts)
keymap("n", "<Leader>h", ":bprev<CR>", opts)
keymap("i", "jj", "<ESC>", opts)
-- telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>", opts)
keymap("n", "<M-g>", "<cmd>lua require('telescope.builtin').live_grep( { cwd = vim.fn.expand('%:p:h') })<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope frecency<cr>", opts)


if vim.g.vscode == nil then
  keymap("n", "<Leader>yy", ":let @* = expand('%:p:h')<CR>", opts)
else
  keymap("n", "<silent><Leader>yy", ":call v:lua.GetDirPath()<CR>", opts)
end

function GetDirPath()
  local all_path = vim.fn.expand("%:p:h")
  local dir_path = vim.fn.split(all_path, '-file://')
  local cmd_str = "let @* = "..'"'..dir_path[2]..'"'
  vim.cmd(cmd_str)
end

