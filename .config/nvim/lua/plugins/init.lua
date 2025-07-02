return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  --   config = function()
  --     require("mason-lspconfig").setup {
  --       ensure_installed = { "python-lsp-server" },
  --     }
  --   end,
  -- },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { lazy = false },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = { lazy = false },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    config = function()
      require "configs.treesitter"
    end,
    -- opts = require "configs.treesitter",
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      provider = "gemini",
      gemini = {
        -- You can specify a particular model here, for example:
        -- model = "gemini-2.5-pro",
      },
      -- It is recommended to set your API key as an environment variable
      -- export GEMINI_API_KEY="YOUR_API_KEY_PLACEHOLDER"
    },
    config = function(_, opts)
      require("avante").setup(opts)
    end,
  },
}
