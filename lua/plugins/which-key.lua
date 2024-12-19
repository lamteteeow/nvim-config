local wk = require("which-key")
return {
    wk.add({
        { "<leader>;", ":lua Snacks.dashboard()<CR>", desc = "Dashboard" },
        -- { "<leader>cs", ":Silicon<CR>", desc = "Snapshot Code", mode = "v" }, -- already defined in nvim-silicon

        -- Telescope
        -- { "<leader>fs", ":Telescope live_grep<CR>", desc = "Grep" }, -- existed by default from LazyVim as <leader>/
        -- { "<leader>fz", ":Telescope zoxide list<CR>", desc = "Zoxide List" },
        -- { "<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps" }, -- existed as <leader>sk
        -- { "<leader>fu", ":Telescope undo<cr>", desc = "Undo tree" },
        -- { "<leader>fm", ":Telescope notify<cr>", desc = "Show all noti" }, -- switch to snacks.notifier

        -- Nvim DAP
        -- { "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", desc = "Debugger step into", mode = "n" },
        -- { "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", desc = "Debugger step over", mode = "n" },
        -- { "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", desc = "Debugger step out", mode = "n" },
        -- { "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Debugger continue", mode = "n" },
        -- {
        --     "<Leader>db",
        --     "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
        --     desc = "Debugger toggle breakpoint",
        --     mode = "n",
        -- },
        -- {
        --     "<Leader>dd",
        --     "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        --     desc = "Debugger set conditional breakpoint",
        --     mode = "n",
        -- },
        -- { "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", desc = "Debugger reset", mode = "n" },
        -- { "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", desc = "Debugger run last", mode = "n" },

        -- rustaceanvim
        -- { "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", desc = "Debugger testables", mode = "n" },
    }),
}
