local util = require "conform.util"

local SQL_FORMATTER_CONFIG = ".sql-formatter.json"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    sql = { "sql_formatter" },
    python = { "ruff_fix", "ruff_format" },
    go = { "goimports", "gofumpt" },
    rust = { "rustfmt" },
  },

  formatters = {
    sql_formatter = {
      -- sql-formatter looks for .sql-formatter.json relative to its working
      -- directory, which conform leaves as Neovim's cwd rather than the
      -- buffer's project. Anchor it to the project so repo-local config wins.
      cwd = util.root_file { SQL_FORMATTER_CONFIG },
      prepend_args = function(_, ctx)
        if vim.fs.root(ctx.dirname, SQL_FORMATTER_CONFIG) then
          return {}
        end

        -- The default "sql" dialect is a parse error on Postgres syntax such as
        -- `a::text`, which fails the whole format run.
        return { "--language", "postgresql" }
      end,
    },
  },

  format_on_save = function(bufnr)
    local filepath = vim.api.nvim_buf_get_name(bufnr)

    if filepath:match("%.test%.ts$") then
      return {
        timeout_ms = 500,
        lsp_fallback = true,
        formatters = { "prettierd", "prettier" },
      }
    end

    return {
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
}

return options
