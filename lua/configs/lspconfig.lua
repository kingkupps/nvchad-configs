require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "pyright",
  "ts_ls",
  "rust_analyzer",
  "gopls",
  "jdtls",
}
vim.lsp.enable(servers)
