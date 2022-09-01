
local options = {
  cursorline = true,
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  synmaxcol = 300,
  list = true,
  -- 不可視文字を可視化(タブが「▸-」と表示される)
  listchars = 'tab:»-',
  encoding = "utf-8",
  -- 行頭以外のTab文字の表示幅（スペースいくつ分）
  tabstop = 2,
  shiftwidth = 2,
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  wrapscan = true,
  hlsearch = true,
  undofile = true,
  fileencoding = "utf-8",
  clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.cmd 'MP MarkdownPreview'

vim.cmd [[
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif
]]
