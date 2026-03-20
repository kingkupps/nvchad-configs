local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    sql = { "sql_formatter" },
    python = { "ruff_fix", "ruff_format" },
    go = { "goimports", "gofumpt" },
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
