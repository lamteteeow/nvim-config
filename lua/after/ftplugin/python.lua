-- open a split-screen terminal and run the current python file in it
local function run_curr_python_file()
    -- get file name in the current buffer
    local file_name = vim.api.nvim_buf_get_name(0)
    if file_name == "" then
        vim.notify("No file to run!", vim.log.levels.WARN)
        return
    end
    -- get terminal codes for running python file
    -- ("i" to enter insert before typing rest of the command)
    -- local py_cmd = string.format('uv run python "%s"\r', file_name)
    local py_cmd = vim.api.nvim_replace_termcodes('uv run python "' .. file_name .. '"<cr>', true, false, true)
    -- local py_cmd = vim.api.nvim_replace_termcodes('ipython "' .. file_name .. '"<cr>', true, false, true)

    -- determine terminal window split and launch terminal
    local percent_of_win = 0.35
    local curr_win_height = vim.api.nvim_win_get_height(0) -- current window height
    local term_height = math.floor(curr_win_height * percent_of_win) -- terminal height
    vim.cmd(":below " .. term_height .. "split | term") -- launch terminal (horizontal split)

    -- Enter insert mode in the terminal
    vim.cmd("startinsert")

    -- press keys to run python command on current file
    vim.api.nvim_feedkeys(py_cmd, "t", false)
end

-- vim.keymap.set({ "n" }, "<a-r>", "", {
--     desc = "run .py file via neovim built-in terminal",
--     callback = run_curr_python_file,
-- })

vim.keymap.set("n", "<A-r>", run_curr_python_file, {
    desc = "Run current .py file in a terminal using uv",
})

-- Using inbuilt floating toggle terminal
-- local function run_curr_python_file()
--     -- Get file name in the current buffer
--     local file_name = vim.api.nvim_buf_get_name(0)
--
--     -- Get terminal codes for running python file
--     local py_cmd = vim.api.nvim_replace_termcodes('python "' .. file_name .. '"<cr>', true, false, true)
--
--     -- Get terminal codes for key-press sequence to launch toggleterm in LunarVim
--     -- (one may have to use <C-\\> for Ctrl + backslash)
--     local lazyvim_togterm_cmd = vim.api.nvim_replace_termcodes("<C-/>", true, false, true)
--
--     -- Press keys to launch toggleterm in LunarVim
--     vim.api.nvim_feedkeys(lazyvim_togterm_cmd, "m", true)
--
--     -- Press keys to run python command on current file
--     vim.api.nvim_feedkeys(py_cmd, "t", false)
-- end
--
-- vim.keymap.set({ "n" }, "<A-r>", "", {
--     desc = "run .py file via toggle term",
--     callback = run_curr_python_file,
-- })
