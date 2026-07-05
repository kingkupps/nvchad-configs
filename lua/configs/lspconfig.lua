require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "clangd",
  "cssls",
  "pyright",
  "ts_ls",
  "rust_analyzer",
  "gopls",
  "jdtls",
}
vim.lsp.enable(servers)

-- Open files with folds expanded
vim.opt.foldlevelstart = 99

-- Use LSP folding when the attached client supports it
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_set_option_value("foldmethod", "expr", { win = win })
      vim.api.nvim_set_option_value("foldexpr", "v:lua.vim.lsp.foldexpr()", { win = win })
      -- foldlevelstart isn't re-applied when foldmethod switches after the window
      -- is already open, so the new expr folds would default to closed. Force them open.
      vim.api.nvim_set_option_value("foldlevel", 99, { win = win })
    end
  end,
})
