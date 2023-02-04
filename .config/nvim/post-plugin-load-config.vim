lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"css", "javascript", "json", "lua", "python", "ruby", "scss", "supercollider", "vim", "vue", "yaml"},
  context_commentstring = {
    enable = true
  },
  matchup = { -- for vim-matchup
    enable = true,
  },
  highlight = {
    enable = true,
  }
}
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
EOF
