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
require 'packer'.startup(function()
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { "wbthomason/packer.nvim", run='npm i -g textlint textlint-filter-rule-allowlist textlint-rule-preset-ja-technical-writing textlint-rule-preset-jtf-style textlint-rule-prh textlint-filter-rule-comments' }
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
  -- thema
  use({ "EdenEast/nightfox.nvim", run = ":NightfoxCompile" })
  -- commandiline
  use({
  "folke/noice.nvim",
  event = "VimEnter",
  config = function()
    require("noice").setup()
  end,
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  })
  -- line系
  use({ 'akinsho/bufferline.nvim' })
  use({ 'ryanoasis/vim-devicons' })
  use({ 'nvim-lualine/lualine.nvim' })
  -- fuzzy-finder
  use({ 'nvim-lua/plenary.nvim' })
  use({ 'nvim-telescope/telescope.nvim' })
  use({ 'tami5/sqlite.lua' })
  use({ 'kyazdani42/nvim-web-devicons' })
  use({ 'nvim-telescope/telescope-frecency.nvim' })
  use({ 'nvim-treesitter/nvim-treesitter' })
  use({ 'nvim-telescope/telescope-file-browser.nvim' })
  -- editor-util
  use({ 'machakann/vim-sandwich' })
  use({ 'tpope/vim-commentary' })
  use({ 'chentoast/marks.nvim' })
  use({ 'mattn/vim-maketable' })
  use({ 'jiangmiao/auto-pairs' })
  use({ 'pwntester/octo.nvim' })
  use({ 'tpope/vim-repeat' })
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use({'mechatroner/rainbow_csv'})
  -- ToDo management
  use({'freitass/todo.txt-vim'})
  -- terminal
  use({ 'voldikss/vim-floaterm' })
  use({ 'thinca/vim-quickrun' })
  -- template
  use({ 'mattn/vim-sonictemplate' })
  -- git
  use({ 'sindrets/diffview.nvim' })
  use({ 'airblade/vim-gitgutter' })
  use({ 'tpope/vim-fugitive' })
  use({ "tpope/vim-rhubarb" })
  use({ 'akinsho/git-conflict.nvim' })
end)

require('line_setting')
require('telescope_setting')
require('tree_sitter_setting')
require('git_setting')
require('editor_util_setting')
require('color')
