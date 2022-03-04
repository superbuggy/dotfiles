lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"css", "javascript", "json", "lua", "python", "ruby", "scss", "supercollider", "vim", "vue", "yaml"},
  context_commentstring = {
    enable = true
  }
}
EOF
