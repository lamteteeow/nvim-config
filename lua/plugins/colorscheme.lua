local transparent_background = true
if vim.g.neovide then
    transparent_background = false
end

return {
    -- {
    --     "catppuccin/nvim",
    --     lazy = true,
    --     name = "catppuccin",
    --     opts = {
    --         integrations = {
    --             aerial = true,
    --             alpha = true,
    --             cmp = true,
    --             dashboard = true,
    --             flash = true,
    --             gitsigns = true,
    --             headlines = true,
    --             illuminate = true,
    --             indent_blankline = { enabled = true },
    --             leap = true,
    --             lsp_trouble = true,
    --             mason = true,
    --             markdown = true,
    --             mini = true,
    --             native_lsp = {
    --                 enabled = true,
    --                 underlines = {
    --                     errors = { "undercurl" },
    --                     hints = { "undercurl" },
    --                     warnings = { "undercurl" },
    --                     information = { "undercurl" },
    --                 },
    --             },
    --             navic = { enabled = true, custom_bg = "lualine" },
    --             neotest = true,
    --             neotree = true,
    --             noice = true,
    --             notify = true,
    --             semantic_tokens = true,
    --             telescope = true,
    --             treesitter = true,
    --             treesitter_context = true,
    --             which_key = true,
    --         },
    --         color_overrides = {
    --             frappe = {
    --                 text = "#F4CDE9",
    --                 subtext1 = "#DEBAD4",
    --                 subtext0 = "#C8A6BE",
    --                 overlay2 = "#B293A8",
    --                 overlay1 = "#9C7F92",
    --                 overlay0 = "#866C7D",
    --                 surface2 = "#705867",
    --                 surface1 = "#5A4551",
    --                 surface0 = "#44313B",
    --                 base = "#352939",
    --                 mantle = "#211924",
    --                 crust = "#1a1016",
    --             },
    --         },
    --         transparent_background = true,
    --     },
    -- },
    -- {
    --     "sainnhe/gruvbox-material",
    -- },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = true,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = transparent_background,
            -- transparent_mode = true,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin-frappe",
            colorscheme = "gruvbox",
            -- colorscheme = "gruvbox-material",
        },
    },
}
