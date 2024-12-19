return {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    -- dependencies = "rafamadriz/friendly-snippets",
    -- dependencies = "supermaven-inc/supermaven-nvim",
    dependencies = {
        { "L3MON4D3/LuaSnip", version = "v2.*" },
        { "rafamadriz/friendly-snippets" },
    },

    -- use a release tag to download pre-built binaries
    version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        enabled = function()
            return true
        end,
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define your own keymap.
        keymap = {
            preset = "enter",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            -- ["<C-space>"] = { "hide_documentation" },
            -- disable a keymap from the preset
            -- ["<C-p>"] = {},
            -- ["<C-n>"] = {},

            -- show with a list of providers
            --   ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },

            -- note that your function will often be run in a "fast event" where most vim.api functions will throw an error
            -- you may want to wrap your function in `vim.schedule` or use `vim.schedule_wrap`
            --   ['<C-space>'] = { function(cmp) vim.schedule(function() your_behavior end) },

            -- optionally, define different keymaps for cmdline
            --   cmdline = {
            --     preset = 'super-tab'
            --   }
            -- }

            -- When defining your own keymaps without a preset, no keybinds will be assigned automatically.

            -- Available commands:
            --   show, hide, cancel, accept, select_and_accept, select_prev, select_next, show_documentation, hide_documentation,
            --   scroll_documentation_up, scroll_documentation_down, snippet_forward, snippet_backward, fallback
            --
            -- "default" keymap
            --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            --   ['<C-e>'] = { 'hide' },
            --   ['<C-y>'] = { 'select_and_accept' },
            --
            --   ['<C-p>'] = { 'select_prev', 'fallback' },
            --   ['<C-n>'] = { 'select_next', 'fallback' },
            --
            --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            --
            --   ['<Tab>'] = { 'snippet_forward', 'fallback' },
            --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            --
            -- "super-tab" keymap
            --   you may want to set `completion.trigger.show_in_snippet = false`
            --   or use `completion.list.selection = "manual" | "auto_insert"`
            --
            --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            --   ['<C-e>'] = { 'hide', 'fallback' },
            --
            --   ['<Tab>'] = {
            --     function(cmp)
            --       if cmp.snippet_active() then return cmp.accept()
            --       else return cmp.select_and_accept() end
            --     end,
            --     'snippet_forward',
            --     'fallback'
            --   },
            --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            --
            --   ['<Up>'] = { 'select_prev', 'fallback' },
            --   ['<Down>'] = { 'select_next', 'fallback' },
            --   ['<C-p>'] = { 'select_prev', 'fallback' },
            --   ['<C-n>'] = { 'select_next', 'fallback' },
            --
            --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            --
            -- "enter" keymap
            --   you may want to set `completion.list.selection = "manual" | "auto_insert"`
            --
            --   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            --   ['<C-e>'] = { 'hide', 'fallback' },
            --   ['<CR>'] = { 'accept', 'fallback' },
            --
            --   ['<Tab>'] = { 'snippet_forward', 'fallback' },
            --   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            --
            --   ['<Up>'] = { 'select_prev', 'fallback' },
            --   ['<Down>'] = { 'select_next', 'fallback' },
            --   ['<C-p>'] = { 'select_prev', 'fallback' },
            --   ['<C-n>'] = { 'select_next', 'fallback' },
            --
            --   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            --   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        },

        trigger = {
            -- When true, will prefetch the completion items when entering insert mode
            -- WARN: buggy, not recommended unless you'd like to help develop prefetching
            prefetch_on_insert = false,
            -- When false, will not show the completion window automatically when in a snippet
            show_in_snippet = true,
            -- When true, will show the completion window after typing a character that matches the `keyword.regex`
            show_on_keyword = false,
            -- When true, will show the completion window after typing a trigger character
            show_on_trigger_character = false,
            -- LSPs can indicate when to show the completion window via trigger characters
            -- however, some LSPs (i.e. tsserver) return characters that would essentially
            -- always show the window. We block these by default.
            show_on_blocked_trigger_characters = function()
                if vim.api.nvim_get_mode().mode == "c" then
                    return {}
                end

                -- you can also block per filetype, for example:
                -- if vim.bo.filetype == 'markdown' then
                --   return { ' ', '\n', '\t', '.', '/', '(', '[' }
                -- end

                return { " ", "\n", "\t" }
            end,
            -- When both this and show_on_trigger_character are true, will show the completion window
            -- when the cursor comes after a trigger character after accepting an item
            show_on_accept_on_trigger_character = true,
            -- When both this and show_on_trigger_character are true, will show the completion window
            -- when the cursor comes after a trigger character when entering insert mode
            show_on_insert_on_trigger_character = true,
            -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
            -- the completion window when the cursor comes after a trigger character when
            -- entering insert mode/accepting an item
            show_on_x_blocked_trigger_characters = { "'", '"', "(" },
            -- or a function, similar to show_on_blocked_trigger_character
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = false,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        snippets = {
            expand = function(snippet)
                require("luasnip").lsp_expand(snippet)
            end,
            active = function(filter)
                if filter and filter.direction then
                    return require("luasnip").jumpable(filter.direction)
                end
                return require("luasnip").in_snippet()
            end,
            jump = function(direction)
                require("luasnip").jump(direction)
            end,
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            -- optionally disable cmdline completions
            -- cmdline = {},
            compat = { "supermaven" },
            providers = {
                supermaven = {
                    kind = "Supermaven",
                    score_offset = 100,
                    async = true,
                },
            },
        },

        completion = {
            list = {
                max_items = 10,
                -- Controls how the completion items are selected
                -- 'preselect' will automatically select the first item in the completion list
                -- 'manual' will not select any item by default
                -- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
                selection = "auto_insert",
            },
            -- menu = {
            --     draw = {
            --         columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
            --         components = {
            --             item_idx = {
            --                 text = function(ctx)
            --                     return tostring(ctx.idx)
            --                 end,
            --                 highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
            --             },
            --         },
            --     },
            -- },
        },

        -- experimental signature help support
        signature = { enabled = false },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },
}
