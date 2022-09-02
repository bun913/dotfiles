require('git-conflict').setup()
require"octo".setup({
  mappings = {
    submit_win = {
      approve_review = { lhs = "<Leader>gra", desc = "approve review" },
      comment_review = { lhs = "<Leader>grm", desc = "comment review" },
      request_changes = { lhs = "<Leader>grc", desc = "request changes review" },
    },
  }
})
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<Leader>r", "<cmd>QuickRun<CR>", opts)
keymap("n", "ghp", "<Plug>(GitGutterPreviewHunk)", opts)
keymap("n", "ghs", "<Plug>(GitGutterStageHunk)", opts)
keymap("n", "ghu", "<Plug>(GitGutterUndoHunk)", opts)
keymap("n", "gs", ":Gstatus<cr>", opts)
keymap("n", "gb", ":Git blame<cr>", opts)
keymap("n", "gbiff", ":Gdiff<cr>", opts)
keymap("n", "ghist", ":DiffviewFileHistory<cr>", opts)
keymap("n", "<Leader>gprl", ":Octo pr list<CR>", opts)
keymap("n", "<Leader>gprc", ":Octo pr create<CR>", opts)
keymap("n", "<Leader>gpre", ":Octo pr edit", opts)
keymap("n", "<Leader>gprs", ":Octo pr search<CR>", opts)
keymap("n", "<Leader>gil", ":Octo issue list<CR>", opts)
keymap("n", "<Leader>gic", ":Octo issue create<CR>", opts)
keymap("n", "<Leader>gie", ":Octo issue edit ", opts)
keymap("n", "<Leader>gis", ":Octo issue search<CR>", opts)
keymap("n", "<Leader>grs", ":Octo review start<CR>", opts)
keymap("n", "<Leader>gre", ":Octo review submit<CR>", opts)

