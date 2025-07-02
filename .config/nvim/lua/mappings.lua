require "nvchad.mappings"
local telescope = require "telescope.builtin"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fc", telescope.commands, { desc = "Search commands with Telescope" })
map("n", "<leader>fk", telescope.keymaps, { desc = "Search keymaps with Telescope" })
-- Keymaps for navigating to the next and previous symbols

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
