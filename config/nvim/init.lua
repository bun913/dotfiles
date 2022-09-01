require('plugins')
require('lsp_setting')
require('base')
require('keymaps')
require('autocmds')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
