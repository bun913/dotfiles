local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
require'marks'.setup {
  default_mappings = true,
}
-- floaterm
vim.g.floaterm_autoclose  = 1
keymap("n", "<M-t>", "<cmd>Telescope frecency<cr>", opts)
keymap("n", "<Leader>t", ":FloatermNew! test<CR>", opts)
vim.cmd [[
command! T :FloatermToggle -autoclose=1<CR>
]]
-- sonictemplate
keymap("n", "<C-t>", "<cmd>Template", opts)
keymap("i", "<C-t>", "<ESC>:Template ", opts)
vim.g.sonictemplate_vim_template_dir = {'~/dotfiles/config/nvim/vim-sonic-template'}
-- maketable
vim.cmd [[
command MT MakeTable
]]
