require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
      'lua',
      'c_sharp'
    },
    ensure_installed = {
      "python",
      "go",
      "js",
      "ts",
      "json",
      "toml",
      "yml",
      "hcl"
    },
    indent = {
      enable  = true
    },
    autotag = {
      enable = true
    }
  }
}


