local previewers = require("telescope.previewers")

-- -- Disable previewer's highlighting for certain filetypes
-- local _bad = { ".*%.csv" } -- Put all filetypes that slow you want to show only as pure text in this array
-- local bad_files = function(filepath)
--     for _, v in ipairs(_bad) do
--         if filepath:match(v) then
--             return false
--         end
--     end
--
--     return true
-- end
--
-- local new_maker = function(filepath, bufnr, opts)
--     opts = opts or {}
--     if opts.use_ft_detect == nil then
--         opts.use_ft_detect = true
--     end
--     opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
--     previewers.buffer_previewer_maker(filepath, bufnr, opts)
-- end

return {
    {
        "nvim-telescope/telescope.nvim",
        -- change some options
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                cond = vim.fn.executable("cmake") == 1,
            },
            "debugloop/telescope-undo.nvim",
        },
        -- opts = {
        --     defaults = {},
        -- },
        config = function()
            local status_ok, t = pcall(require, "telescope")
            if not status_ok then
                return
            end

            local z_utils = require("telescope._extensions.zoxide.utils")

            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local trouble = require("trouble.sources.telescope")
            local icons = require("config.icons")

            -- Set color of telescope buffer
            -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "none" })

            -- something to be checked
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "TelescopeResults",
                callback = function(ctx)
                    vim.api.nvim_buf_call(ctx.buf, function()
                        vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                        vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                    end)
                end,
            })

            -- Open next picker to select Symbols
            local function document_symbols_for_selected(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")
                local entry = action_state.get_selected_entry()

                if entry == nil then
                    print("No file selected")
                    return
                end

                actions.close(prompt_bufnr)

                vim.schedule(function()
                    local bufnr = vim.fn.bufadd(entry.path)
                    vim.fn.bufload(bufnr)

                    local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }

                    vim.lsp.buf_request(bufnr, "textDocument/documentSymbol", params, function(err, result, _, _)
                        if err then
                            print("Error getting document symbols: " .. vim.inspect(err))
                            return
                        end

                        if not result or vim.tbl_isempty(result) then
                            print("No symbols found")
                            return
                        end

                        local function flatten_symbols(symbols, parent_name)
                            local flattened = {}
                            for _, symbol in ipairs(symbols) do
                                local name = symbol.name
                                if parent_name then
                                    name = parent_name .. "." .. name
                                end
                                table.insert(flattened, {
                                    name = name,
                                    kind = symbol.kind,
                                    range = symbol.range,
                                    selectionRange = symbol.selectionRange,
                                })
                                if symbol.children then
                                    local children = flatten_symbols(symbol.children, name)
                                    for _, child in ipairs(children) do
                                        table.insert(flattened, child)
                                    end
                                end
                            end
                            return flattened
                        end

                        local flat_symbols = flatten_symbols(result)

                        -- Define highlight group for symbol kind
                        vim.cmd([[highlight TelescopeSymbolKind guifg=#61AFEF]])

                        require("telescope.pickers")
                            .new({}, {
                                prompt_title = "Document Symbols: " .. vim.fn.fnamemodify(entry.path, ":t"),
                                finder = require("telescope.finders").new_table({
                                    results = flat_symbols,
                                    entry_maker = function(symbol)
                                        local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Other"
                                        return {
                                            value = symbol,
                                            display = function(entry)
                                                local display_text = string.format("%-50s %s", entry.value.name, kind)
                                                return display_text,
                                                    {
                                                        {
                                                            { #entry.value.name + 1, #display_text },
                                                            "TelescopeSymbolKind",
                                                        },
                                                    }
                                            end,
                                            ordinal = symbol.name,
                                            filename = entry.path,
                                            lnum = symbol.selectionRange.start.line + 1,
                                            col = symbol.selectionRange.start.character + 1,
                                        }
                                    end,
                                }),
                                sorter = require("telescope.config").values.generic_sorter({}),
                                previewer = require("telescope.config").values.qflist_previewer({}),
                                attach_mappings = function(_, map)
                                    map("i", "<CR>", function(prompt_bufnr)
                                        local selection = action_state.get_selected_entry()
                                        actions.close(prompt_bufnr)
                                        vim.cmd("edit " .. selection.filename)
                                        vim.api.nvim_win_set_cursor(0, { selection.lnum, selection.col - 1 })
                                    end)
                                    return true
                                end,
                            })
                            :find()
                    end)
                end)
            end

            t.setup({
                -- file_ignore_patterns = { "%.git/." },
                -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                defaults = {
                    -- buffer_previewer_maker = new_maker,
                    layout_strategy = "vertical",
                    layout_config = {
                        prompt_position = "bottom",
                        height = 0.8, -- old: 0.95
                        width = 0.6,
                        preview_cutoff = 0,
                        preview_height = 0.5, -- old: 0.65
                    },
                    file_ignore_patterns = { "node_modules", "package-lock.json" },
                    initial_mode = "insert",
                    select_strategy = "reset",
                    sorting_strategy = "ascending",
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    sorting_strategy = "descending",
                    winblend = 0,
                    picker = {
                        find_files = {
                            mappings = {
                                n = {
                                    ["cd"] = function(prompt_bufnr)
                                        local selection = require("telescope.actions.state").get_selected_entry()
                                        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                        require("telescope.actions").close(prompt_bufnr)
                                        -- Depending on what you want put `cd`, `lcd`, `tcd`
                                        vim.cmd(string.format("silent lcd %s", dir))
                                    end,
                                },
                            },
                        },
                    },
                    -- Image preview using tiv
                    -- preview = {
                    --     mime_hook = function(filepath, bufnr, opts)
                    --         local is_image = function(filepath)
                    --             local image_extensions = { "png", "jpg" } -- Supported image formats
                    --             local split_path = vim.split(filepath:lower(), ".", { plain = true })
                    --             local extension = split_path[#split_path]
                    --             return vim.tbl_contains(image_extensions, extension)
                    --         end
                    --         if is_image(filepath) then
                    --             local term = vim.api.nvim_open_term(bufnr, {})
                    --             local function send_output(_, data, _)
                    --                 for _, d in ipairs(data) do
                    --                     vim.api.nvim_chan_send(term, d .. "\r\n")
                    --                 end
                    --             end
                    --             vim.fn.jobstart({
                    --                 "tiv",
                    --                 filepath, -- Terminal image viewer command
                    --             }, {
                    --                 on_stdout = send_output,
                    --                 stdout_buffered = true,
                    --                 pty = true,
                    --             })
                    --         else
                    --             require("telescope.previewers.utils").set_preview_message(
                    --                 bufnr,
                    --                 opts.winid,
                    --                 "Binary cannot be previewed"
                    --             )
                    --         end
                    --     end,
                    -- },
                    extensions = {
                        zoxide = {
                            {
                                prompt_title = "[ Walking on the shoulders of TJ ]",
                                mappings = {
                                    default = {
                                        after_action = function(selection)
                                            print("Update to (" .. selection.z_score .. ") " .. selection.path)
                                        end,
                                    },
                                    ["<C-s>"] = {
                                        before_action = function(selection)
                                            print("before C-s")
                                        end,
                                        action = function(selection)
                                            vim.cmd.edit(selection.path)
                                        end,
                                    },
                                    ["<C-q>"] = { action = z_utils.create_basic_command("split") },
                                },
                            },
                        },
                    },
                    mappings = {
                        i = {
                            -- ["<esc>"] = actions.close,
                            ["<C-t>"] = trouble.open,
                            ["<C-h>"] = "which_key",
                            ["<C-s>"] = document_symbols_for_selected,
                        },

                        n = {
                            ["<C-t>"] = trouble.open,
                            ["<C-h>"] = "which_key",
                            ["<C-s>"] = document_symbols_for_selected,
                        },
                    },
                },
            })

            -- Load the telescope extensions
            t.load_extension("zoxide")
            t.load_extension("fzf")
            t.load_extension("undo")

            -- Add mappings
            -- defined in which-key.lua plugin
        end,
    },
}
