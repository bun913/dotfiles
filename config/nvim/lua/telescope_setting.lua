-- brew install luajit
-- brew install rg
-- brew install fd
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["<esc>"] = require('telescope.actions').close,
      },
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<C-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist
      }
    }
  }
}
require"telescope".load_extension("frecency")
local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          ["q"] = actions.close,
          -- your custom normal mode mappings
        },
      },
    },
  },
}

vim.api.nvim_set_keymap(
  "n",
  "<space>n",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
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

