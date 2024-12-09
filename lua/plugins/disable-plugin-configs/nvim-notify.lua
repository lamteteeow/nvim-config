return {
    "rcarriga/nvim-notify",
    opts = {
        -- level = vim.log.levels.INFO,
        timeout = 1000,
        max_width = 30,
        max_height = 20,
        minimum_width = 30,
        stages = "fade_in_slide_out",
        render = "wrapped-compact",
        -- background_colour = "NotifyBackground", -- has no background on gruvbox trannsparent mode
        background_colour = "#000000",
        on_open = nil,
        on_close = nil,
        fps = 30,
        top_down = false,
        time_formats = {
            notification_history = "%FT%T",
            notification = "%T",
        },
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    },
}
