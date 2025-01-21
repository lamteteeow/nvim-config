-- -- Load snacks.nvim/profiler first if requested
-- if vim.env.PROF then
--     -- example for lazy.nvim
--     -- change this to the correct path for your plugin manager
--     local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
--     vim.opt.rtp:append(snacks)
--     require("snacks.profiler").startup({
--         startup = {
--             event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
--             -- event = "UIEnter",
--             -- event = "VeryLazy",
--         },
--     })
-- end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("after.ftplugin.python")

-- require("nvim-treesitter.install").compilers = { "clang", "gcc", "zig" }

vim.g.snacks_animate = false
vim.g.background = "dark" -- "light"/"dark" mode
-- vim.g.gruvbox_material_background = "hard" -- "hard"/"soft"/"medium" contrast
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_enable_bold = 1

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
-- vim.g.python3_host_prog = "C:/Program Files/Programming languages/Python/cpython-3.13.0-windows-x86_64-none/python.exe"
-- vim.g.python3_host_skip_check = 1
