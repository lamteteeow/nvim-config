-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Add any additional keymaps here
local set = vim.keymap.set
set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Def", noremap = true })
set("n", "gr", vim.lsp.buf.references, { desc = "Go to Ref", noremap = true })
set("n", "gh", vim.lsp.buf.hover, { buffer = buffnr, desc = "Hover LSP", noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", { noremap = true, desc = "Find Texts" })

-- vim.g.mapleader = " "                           -- change leader to a space
-- vim.g.maplocalleader = " "                      -- change localleader to a space

-- Remove/Disable an existing mapping
local del = vim.keymap.del

-- del("n", "<leader>ft")
del("n", "<leader>fT")
del("n", "<c-_>")

vim.api.nvim_set_keymap("n", "J", "", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "", { noremap = true })
