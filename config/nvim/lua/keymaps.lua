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
keymap("i", "jj", "<ESC>", opts)
-- formatter
vim.keymap.set('n', '<Leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
-- floaterm
vim.g.floaterm_autoclose  = 1
keymap("n", "<M-t>", "<cmd>Telescope frecency<cr>", opts)
keymap("n", "<Leader>t", ":FloatermNew! test<CR>", opts)
vim.cmd [[
command! T :FloatermToggle -autoclose=1<CR>
]]
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
-- sonictemplate
keymap("n", "<C-t>", "<cmd>Template", opts)
keymap("i", "<C-t>", "<ESC>:Template ", opts)
vim.g.sonictemplate_vim_template_dir = {'~/dotfiles/config/nvim/vim-sonic-template'}

-- git
keymap("n", "<Leader>r", "<cmd>QuickRun<CR>", opts)
keymap("n", "ghp", "<Plug>(GitGutterPreviewHunk)", opts)
keymap("n", "ghs", "<Plug>(GitGutterStageHunk)", opts)
keymap("n", "ghu", "<Plug>(GitGutterUndoHunk)", opts)
keymap("n", "gs", ":Gstatus<cr>", opts)
keymap("n", "gb", ":Git blame<cr>", opts)
keymap("n", "gbiff", ":Gdiff<cr>", opts)
keymap("n", "ghist", ":DiffviewFileHistory<cr>", opts)
vim.cmd [[
nnoremap <Leader>gprl :Octo pr list<CR>
nnoremap <Leader>gprc  :Octo pr create<CR>
nnoremap <Leader>gpre  :Octo pr edit
nnoremap <Leader>gprs  :Octo pr search<CR>
" issue shortcuts
nnoremap <Leader>gil :Octo issue list<CR>
nnoremap <Leader>gic :Octo issue create<CR>
nnoremap <Leader>gie :Octo issue edit
nnoremap <Leader>gis :Octo issue search<CR>
" review
nnoremap <Leader>grs :Octo review start
nnoremap <Leader>gre :Octo review submit<CR>
]]

-- maketable
vim.cmd [[
command MT MakeTable
]]
