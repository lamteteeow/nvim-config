return {
    "ibhagwan/fzf-lua",
    -- build = "./install --bin", -- if fzf not yet installed
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- dependencies = { "echasnovski/mini.icons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            -- { "telescope", "fzf-native" },
            { "telescope" },
            winopts = {
                preview = {
                    -- default = "bat",
                    -- delay = 10,
                    layout = "flex",
                    horizontal = "right:60%",
                    vertical = "up:60%",
                },
                width = 0.8,
                height = 0.75,
                -- border = "none",
                border = "rounded",
                backdrop = "40",
                fullscreen = false,
            },
            previewer = {
                bat = {
                    cmd = "bat",
                    args = "--color=always --style=numbers,changes",
                },
                builtin = {
                    extensions = {
                        -- Alacritty does not support well
                        ["png"] = { "chafa", "{file}" },
                        -- ["png"] = { "viu", "-b" },
                        -- ["jpg"] = { "chafa" },
                    },
                    render_markdown = {
                        enabled = true,
                        filetypes = { ["markdown"] = true },
                    },
                },
            },
        })
    end,
}
