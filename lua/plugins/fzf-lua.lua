return {
    "ibhagwan/fzf-lua",
    -- build = "./install --bin", -- if fzf not yet installed
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            { "telescope", "fzf-native" },
            winopts = {
                preview = {
                    default = "bat",
                    delay = 10,
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
            -- previewer = {
            --     builtin = {
            --         extensions = {
            --             -- ["png"] = { "viu", "chafa", "{file}" },
            --             -- ["png"] = "chafa",
            --             -- ["jpg"] = { "chafa" },
            --         },
            --     },
            -- },
        })
    end,
}
