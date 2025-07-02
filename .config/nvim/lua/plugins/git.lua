-- lua/plugins/git.lua
-- This configuration allows vim-fugitive and neogit to coexist peacefully, each serving a different purpose. Here’s a recommended workflow that leverages the strengths of both:
--
-- Check Status & Stage Interactively (neogit):
--
-- Press <leader>gg to open the Neogit status window.
-- Use s to stage/unstage files or individual hunks (by moving to them and pressing s).
-- Use c to open the commit popup. Press c again to write the commit message and Ctrl-c (or :wq) to save and commit.
-- Run Specific Git Commands (vim-fugitive):
--
-- When you need to do something not easily done in the Neogit UI (like push, pull, or fetch), use Fugitive.
-- Press <leader>gs to open the :Git status buffer.
-- From there, you can type pp to run git push, or P to pull. Or simply run :Git push or :Git pull from any buffer.
-- Investigate History (vim-fugitive):
--
-- When you want to see who last changed a line, open the file and press <leader>gb to bring up :Gblame.
-- Open on GitHub/GitLab (vim-fugitive):
--
-- To view the current file on its web remote, press <leader>go to use :Gbrowse.

return {
  -- VIM-FUGITIVE: The classic Git wrapper
  -- Indispensable for running Git commands directly from Neovim.
  {
    "tpope/vim-fugitive",
    -- We lazy-load on the "Git" command
    cmd = "Git",
    config = function()
      -- Set up some useful keybindings
      local map = vim.keymap.set
      map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "[G]it [S]tatus" })
      map("n", "<leader>gb", "<cmd>Gblame<CR>", { desc = "[G]it [B]lame" })
      map("n", "<leader>go", "<cmd>Gbrowse<CR>", { desc = "[G]it [O]pen on web" })

      -- When viewing a commit, open it in a new vertical split
      vim.api.nvim_create_autocmd("BufReadPost", {
        group = vim.api.nvim_create_augroup("fugitive_commit_open", { clear = true }),
        pattern = "fugitive://*",
        callback = function(args)
          if vim.bo[args.buf].filetype == "gitcommit" then
            vim.cmd("vert sb")
          end
        end,
      })
    end,
  },

  -- vim-rhubarb: Required for :Gbrowse to work on GitHub
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },

  -- NEOGIT: A Magit-like UI for Git
  -- Great for interactive staging, committing, and rebasing.
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional, for enhanced diff views
      "nvim-telescope/telescope.nvim", -- optional, for custom pickers
    },
    -- We lazy-load on the "Neogit" command
    cmd = "Neogit",
    config = function()
      require("neogit").setup({
        -- By default, Neogit will automatically use diffview if it is installed
        integrations = {
          diffview = true,
        },
      })

      -- Set up the main keybinding
      vim.keymap.set("n", "<leader>gg", function()
        require("neogit").open()
      end, { desc = "Open [G]it [G]ui (Neogit)" })
    end,
  },
}
