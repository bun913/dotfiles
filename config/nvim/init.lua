require('plugins')
require('base')
require('keymaps')
require('autocmds')

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
