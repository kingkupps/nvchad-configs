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
