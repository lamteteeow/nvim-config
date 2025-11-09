return {
    "nvim-mini/mini.surround",
    event = "LazyFile",
    lazy = true,
    opts = {
        {
            -- Add custom surroundings to be used on top of builtin ones. For more
            -- information with examples, see `ah MiniSurround.config`.
            custom_surroundings = nil,

            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 1000,

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                add = "sa", -- Add surrounding in Normal and Visual modes
                delete = "sd", -- Delete surrounding in Normal mode (+ key)
                find = "sf", -- Find surrounding (to the right) in Normal mode (+ key)
                find_left = "sF", -- Find surrounding (to the left) in Normal mode (+ key)
                highlight = "sh", -- Highlight surrounding in Normal mode (+ key)
                replace = "sr", -- Replace surrounding in Normal mode (+ key + replacing key)
                update_n_lines = "sn", -- Update `n_lines`

                suffix_last = "l", -- Suffix to search with "prev" method
                suffix_next = "n", -- Suffix to search with "next" method
            },

            -- Number of lines within which surrounding is searched
            n_lines = 30,

            -- Whether to respect selection type
            -- - Place surroundings on separate lines in linewise mode.
            -- - Place surroundings on each line in blockwise mode.
            respect_selection_type = false,

            -- How to search for surrounding (first inside current line, then inside
            -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
            -- see `:h MiniSurround.config`.
            search_method = "cover",

            -- Whether to disable showing non-error feedback
            silent = false,
        },
    },
}
