require "nvchad.autocmds"

-- A left half block makes the tree's separator half as wide as a full cell.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.opt_local.fillchars:append { vert = "▌" }
  end,
})
