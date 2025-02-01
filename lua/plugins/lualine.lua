local mode_map = {
    ["n"] = "N",
    ["no"] = "O·P",
    ["nov"] = "O·P",
    ["noV"] = "O·P",
    ["no\22"] = "O·P",
    ["niI"] = "N·I",
    ["niR"] = "N·R",
    ["niV"] = "N",
    ["nt"] = "N·T",
    ["v"] = "V",
    ["vs"] = "V",
    ["V"] = "V·L",
    ["Vs"] = "V·L",
    ["\22"] = "V·B",
    ["\22s"] = "V·B",
    ["s"] = "S",
    ["S"] = "·L",
    ["\19"] = "S·B",
    ["i"] = "I",
    ["ic"] = "I·C",
    ["ix"] = "I·X",
    ["R"] = "R",
    ["Rc"] = "R·C",
    ["Rx"] = "R·X",
    ["Rv"] = "V·R",
    ["Rvc"] = "RVC",
    ["Rvx"] = "RVX",
    ["c"] = "C",
    ["cv"] = "EX",
    ["ce"] = "EX",
    ["r"] = "R",
    ["rm"] = "M",
    ["r?"] = "C",
    ["!"] = "SH",
    ["t"] = "T",
}

local function modes()
    return mode_map[vim.api.nvim_get_mode().mode] or "__"
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "gruvbox-material",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 120,
                    -- tabline = 120,
                    -- winbar = 120,
                },
            },
            sections = {
                lualine_a = {
                    modes,
                },
                lualine_b = {},
                -- lualine_b = { "filename" },
                -- lualine_b = {
                --     "tabs",
                --     cond = function()
                --         return #vim.fn.gettabinfo() > 1
                --     end,
                -- },
                lualine_c = {},
                -- lualine_x = { "encoding", "fileformat", "filetype" },
                -- lualine_y = { "progress" },
                lualine_x = { "diagnostics", "diff" },
                lualine_y = { "branch" },
                lualine_z = { "location" },
            },

            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "filetype" },
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
