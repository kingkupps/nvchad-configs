return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    keys = {
      {
        "<leader>gb",
        "<cmd>GitBlameToggle<cr>",
        desc = "toggle git blame",
      },
    },
    opts = {
      enabled = false,
    },
    config = function(_, opts)
      require("gitblame").setup(opts)
    end,
  },
}
