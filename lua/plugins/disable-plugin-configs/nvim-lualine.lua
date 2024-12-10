-- optional lualine component to show captured events
-- when the profiler is running
return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        table.insert(opts.sections.lualine_x, Snacks.profiler.status())
    end,
}
