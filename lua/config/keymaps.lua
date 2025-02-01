-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local set = vim.keymap.set
local del = vim.keymap.del

-- Add any additional keymaps here
set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Def", noremap = true })
set("n", "gr", vim.lsp.buf.references, { desc = "Go to Ref", noremap = true })
-- set("n", "gh", vim.lsp.buf.hover, { desc = "Hover LSP", noremap = true })
set("n", "gh", "^", { desc = "First non-white space character of the line", noremap = true })
set("n", "gl", "$", { desc = "Last character of the line", noremap = true })

-- vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", { noremap = true, desc = "Find Texts" }) -- Replaced by fzflua for LazyVim by default

-- rustaceanvim
-- set("n", "<Leader>dt", vim.cmd("RustLsp testables"), { desc = "Debugger testables", noremap = true })

-- Remove/Disable an existing mapping

del("n", "<c-_>")

vim.api.nvim_set_keymap("n", "<S-J>", "", { noremap = true }) -- remove \n from this line
vim.api.nvim_set_keymap("n", "<S-K>", "", { noremap = true }) -- hover LSP
