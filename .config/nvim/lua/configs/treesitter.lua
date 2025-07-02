require "nvim-treesitter.configs".setup {
-- return {
  refactor = {
    smart_rename = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      keymaps = {
        smart_rename = "<leader>rr",
      },
    },
    highlight_current_scope = { enable = true },
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
  },
}
