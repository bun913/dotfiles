local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
keymap("n", "<Leader>gg", ":LazyGit<CR>", opts)

-- formatter
vim.keymap.set('n', '<Leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
