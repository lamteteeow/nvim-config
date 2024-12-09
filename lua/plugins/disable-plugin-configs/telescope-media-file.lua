-- Needs Ueberzug to preview images and such => not for Windows
return {
    "nvim-telescope/telescope-media-files.nvim",
    after = "telescope.nvim",
    opt = {
        filetypes = { "png", "webp", "webm", "pdf", "jpg", "jpeg" },
        find_cmd = "rg", -- find command (defaults to `fd`)
    },
    config = function()
        require("telescope").load_extension("media_files")
    end,
}
