return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- animate = { enabled = false }, -- disabled globally at init.lua
        bigfile = { enabled = false }, -- manually handle bigfile, disable LSP from auto-attaching
        quickfile = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
            width = { min = 56, max = 0.5 },
            padding = true,
            height = { min = 1, max = 0.7 },
        },
        lazygit = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true }, -- Wrap notifications
            },
        },
        dashboard = {
            enabled = true,

            preset = {
                header = [[

████ ██████           
███████████             
 █████████ ███████████
 █████████  ███    █████
 █████████ ██████████ ██
███████████ ███    ███ ███
██████  █████████████████████

                ]],
                keys = {
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    -- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    -- { icon = "   ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    {
                        icon = "󰄉 ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    -- {
                    --     icon = "󱗼",
                    --     key = "w",
                    --     desc = "Workbench",
                    --     action = ":e C:/Users/Admin/Documents/Workbench <CR>",
                    -- },
                    -- { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = "󱐥", key = "u", desc = "Update plugins", action = "<cmd>Lazy update<CR>" },
                    -- { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
        profiler = {
            enabled = false,
            -- opts = function()
            --     -- Toggle the profiler
            --     Snacks.toggle.profiler():map("<leader>pp")
            --     -- Toggle the profiler highlights
            --     Snacks.toggle.profiler_highlights():map("<leader>ph")
            -- end,
        },
        scope = {
            enalbed = true,
        },
        indent = {
            enabled = true,
        },
    },
    keys = {
        -- {
        --     "<leader>ps",
        --     function()
        --         Snacks.profiler.scratch()
        --     end,
        --     desc = "Profiler Scratch Buffer",
        -- },
        -- {
        --     "<leader>fm", -- default <leader>n
        --     function()
        --         Snacks.notifier.show_history()
        --     end,
        --     desc = "Notifications History",
        -- },
        -- {
        --     "<leader>un",
        --     function()
        --         Snacks.notifier.hide()
        --     end,
        --     desc = "Dismiss All Notifications",
        -- },
        -- {
        --     "<leader>bd",
        --     function()
        --         Snacks.bufdelete()
        --     end,
        --     desc = "Delete Buffer",
        -- },
        -- {
        --     "<leader>gg",
        --     function()
        --         Snacks.lazygit()
        --     end,
        --     desc = "Lazygit",
        -- },
        -- {
        --     "<leader>gb",
        --     function()
        --         Snacks.git.blame_line()
        --     end,
        --     desc = "Git Blame Line",
        -- },
        -- {
        --     "<leader>gB",
        --     function()
        --         Snacks.gitbrowse()
        --     end,
        --     desc = "Git Browse",
        -- },
        -- {
        --     "<leader>gf",
        --     function()
        --         Snacks.lazygit.log_file()
        --     end,
        --     desc = "Lazygit Current File History",
        -- },
        -- {
        --     "<leader>gl",
        --     function()
        --         Snacks.lazygit.log()
        --     end,
        --     desc = "Lazygit Log (cwd)",
        -- },
        -- {
        --     "<leader>cR",
        --     function()
        --         Snacks.rename.rename_file()
        --     end,
        --     desc = "Rename File",
        -- },
        -- {
        --     "<c-/>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "Toggle Terminal",
        -- },
        -- {
        --     "<c-_>",
        --     function()
        --         Snacks.terminal()
        --     end,
        --     desc = "which_key_ignore",
        -- },
        -- {
        --     "]]",
        --     function()
        --         Snacks.words.jump(vim.v.count1)
        --     end,
        --     desc = "Next Reference",
        --     mode = { "n", "t" },
        -- },
        -- {
        --     "[[",
        --     function()
        --         Snacks.words.jump(-vim.v.count1)
        --     end,
        --     desc = "Prev Reference",
        --     mode = { "n", "t" },
        -- },
        -- {
        --     "<leader>N",
        --     desc = "Neovim News",
        --     function()
        --         Snacks.win({
        --             file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        --             width = 0.6,
        --             height = 0.6,
        --             wo = {
        --                 spell = false,
        --                 wrap = false,
        --                 signcolumn = "yes",
        --                 statuscolumn = " ",
        --                 conceallevel = 3,
        --             },
        --         })
        --     end,
        -- },
    },
    -- init = function()
    --     vim.api.nvim_create_autocmd("User", {
    --         pattern = "VeryLazy",
    --         callback = function()
    --             -- Setup some globals for debugging (lazy-loaded)
    --             _G.dd = function(...)
    --                 Snacks.debug.inspect(...)
    --             end
    --             _G.bt = function()
    --                 Snacks.debug.backtrace()
    --             end
    --             vim.print = _G.dd -- Override print to use snacks for `:=` command
    --
    --             -- Create some toggle mappings
    --             Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    --             Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    --             Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    --             Snacks.toggle.diagnostics():map("<leader>ud")
    --             Snacks.toggle.line_number():map("<leader>ul")
    --             Snacks.toggle
    --                 .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
    --                 :map("<leader>uc")
    --             Snacks.toggle.treesitter():map("<leader>uT")
    --             Snacks.toggle
    --                 .option("background", { off = "light", on = "dark", name = "Dark Background" })
    --                 :map("<leader>ub")
    --             Snacks.toggle.inlay_hints():map("<leader>uh")
    --         end,
    --     })
    -- end,
}
