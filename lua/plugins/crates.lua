return {
    "saecki/crates.nvim",
    event = "BufRead Cargo.toml", -- or for more general ft = { "toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("crates").setup({
            completion = {
                cmp = {
                    enabled = true,
                },
            },
        })
        -- -- defined in nvim-cmp.lua
        -- require("cmp").setup.buffer({
        --     sources = { { name = "crates" } },
        -- })
    end,
}
