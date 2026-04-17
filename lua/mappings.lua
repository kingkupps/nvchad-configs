require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Drag highlighted code
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Save and exit insert mode
map("i", "<C-s>", "<Esc>:w<CR>", { desc = "save file" })

-- Search for references the right way
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope lsp references" })

-- Auto wrap with symbol
map("v", "{", "<Esc>`>a}<Esc>`<i{<Esc>", { desc = "surround selection with {}" })
map("v", "(", "<Esc>`>a)<Esc>`<i(<Esc>", { desc = "surround selection with ()" })
map("v", "'", "<Esc>`>a'<Esc>`<i'<Esc>", { desc = "surround selection with ''" })
map("v", '"', "<Esc>`>a\"<Esc>`<i\"<Esc>", { desc = "surround selection with \"\"" })

-- Exit all buffers
map("n", "<leader>qq", ":qa<CR>")
