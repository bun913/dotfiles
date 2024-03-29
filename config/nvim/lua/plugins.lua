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
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
  -- cmp(補完)
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use 'hrsh7th/cmp-path'
  use "hrsh7th/cmp-buffer"
  use 'onsails/lspkind.nvim'
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-vsnip"
  -- thema
  -- use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use "EdenEast/nightfox.nvim"
  -- commandiline
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require('lspsaga').setup({})
    end,
  })
  -- filer系
  use({
  'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
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
  -- terminal
  use({ 'voldikss/vim-floaterm' })
  use({ 'thinca/vim-quickrun' })
  -- git
  use 'kdheepak/lazygit.nvim'
  use {
  'lewis6991/gitsigns.nvim',
  }
  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}
  -- git hub copilot
  use({'github/copilot.vim'})
  -- golang
  use { "fatih/vim-go", opt = true, ft = { "go" } }
  -- quickfix
  use "itchyny/vim-qfedit"
  use {'kevinhwang91/nvim-bqf'}
  use "thinca/vim-qfreplace"
end)

require('line_setting')
require('telescope_setting')
require('tree_sitter_setting')
require('git_setting')
require('editor_util_setting')
require('color')
require('nvim-tree_setting')
require('snip')
