-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("after.ftplugin.python")

require("nvim-treesitter.install").compilers = { "clang", "gcc", "zig" }

vim.g.background = "dark" -- "light"/"dark" mode
-- vim.g.gruvbox_material_background = "hard" -- "hard"/"soft"/"medium" contrast
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_enable_bold = 1

vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.python3_host_prog = "C:/Program Files/Programming languages/Python/cpython-3.13.0-windows-x86_64-none/python.exe"
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1

-- Neovide only settings (transparency only works in terminal at the moment)
if vim.g.neovide then
    -- General
    -- vim.g.transparency = 0.83
    -- local alpha = function()
    --     return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
    -- end
    -- vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.g.neovide_transparency = 0.83
    -- vim.g.neovide_floating_opacity = 0.5 -- deprecated
    -- vim.g.neovide_floating_transparency = 0.5 -- deprecated
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_refresh_rate = 144
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_scroll_animation_length = 0.2
    vim.g.neovide_scroll_animation_far_lines = 1
    vim.g.neovide_unlink_border_highlights = true
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_show_border = false
    vim.g.neovide_theme = "auto"

    -- Start directory

    -- Line spacing
    vim.opt.linespace = 1

    -- Text
    vim.g.neovide_text_contrast = 0.0
    vim.g.neovide_text_gamma = 0.5

    -- Padding
    vim.g.neovide_padding_top = 7
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- Cursor
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animation_length = 0.02
    vim.g.neovide_cursor_trail_size = 0.9
    vim.g.neovide_cursor_vfx_mode = "wireframe"
    vim.g.neovide_cursor_vfx_opacity = 250.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 0.6
    vim.g.neovide_cursor_vfx_particle_density = 9.0
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    -- vim.g.neovide_cursor_vfx_particle_phase = 1.5
    -- vim.g.neovide_cursor_vfx_particle_curl = 1.0
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_cursor_antialiasing = false

    -- -- Helper function for transparency formatting
    -- local alpha = function()
    --     return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
    -- end
    -- -- Set transparency and background color (title bar color)
    -- vim.g.neovide_transparency = 0.0
    -- vim.g.neovide_transparency_point = 0.8
    -- vim.g.neovide_background_color = "#0f1117" .. alpha()
    -- -- Add keybinds to change transparency
    -- local change_transparency = function(delta)flash
    --     vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
    --     vim.g.neovide_background_color = "#0f1117" .. alpha()
    -- end
    -- vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
    --     change_transparency(0.01)
    -- end)
    -- vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
    --     change_transparency(-0.01)
    -- end)

    -- vim.g.gruvbox_material_transparent_background = 0 -- 2/1/0 (2 for status line)
    -- else
    -- vim.g.gruvbox_material_transparent_background = 1 -- 2/1/0 (2 for status line)
end
