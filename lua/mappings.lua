require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("i", "<C-s>", "<Esc>:w<CR>", { desc = "save file" })

map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope lsp references" })

map("v", "{", "<Esc>`>a}<Esc>`<i{<Esc>", { desc = "surround selection with {}" })
