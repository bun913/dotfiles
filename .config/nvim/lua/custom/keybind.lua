vim.api.nvim_create_user_command('CopyRelativePath', function()
  local path = vim.fn.expand '%'
  vim.fn.setreg('+', path)
end, {})
