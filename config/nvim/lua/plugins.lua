local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
  open_fn = function()
    return require("packer.util").float({ border = "rounded" })
  end,
 },
})
require'packer'.startup(function()
  -- 起動時に読み込むプラグインは名前を書くだけです
  use({'prabirshrestha/vim-lsp'})
  use({'prabirshrestha/asyncomplete.vim'})
  use({'prabirshrestha/asyncomplete-lsp.vim'})
  -- line系
  use({'akinsho/bufferline.nvim'})
  use({'ryanoasis/vim-devicons'})
  use({'nvim-lualine/lualine.nvim'})
  -- fuzzy-finder
  use({'nvim-lua/plenary.nvim'})
  use({'nvim-telescope/telescope.nvim'})
  use({'tami5/sqlite.lua'})
  use({'kyazdani42/nvim-web-devicons'})
  use({'nvim-telescope/telescope-frecency.nvim'})
end)

require("bufferline").setup{}
require('lualine').setup {
sections = {
  lualine_a = {
    {
      'filename',
      file_status = true,      -- Displays file status (readonly status, modified status)
      path = 3,                -- 0: Just the filename
                               -- 1: Relative path
                               -- 2: Absolute path
                               -- 3: Absolute path, with tilde as the home directory

      shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                               -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
      }
    }
  }
}
}

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
