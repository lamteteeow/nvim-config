-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Font settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- smart case

-- vim.opt.guifont = "CaskaydiaMono Nerd Font Mono:h13" -- the font used in graphical neovim applications
vim.opt.virtualedit = "block" -- Allow cursor to move anywhere in visual block mode (by default is "all")

-- Environment
vim.env.TMP = "C:/Users/Admin/AppData/Local/Temp"

-- Integrated terminal settings
vim.opt.shell = "bash.exe"
vim.opt.shellcmdflag = "-c"
vim.g.terminal_emulator = "bash"
vim.opt.termguicolors = true -- True color support
vim.opt.autochdir = true
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.incsearch = true -- make search act like search in modern browsers
vim.opt.showcmd = false -- Don't show the command in the last line
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore but I think it does not matter due to noice.nvim (lualine, cmdline, notify, etc.)

-- Status line
vim.opt.laststatus = 3 -- views can only be fully collapsed with the global statusline
-- vim.opt.laststatus = 0 -- Always display the status line

-- Indentation settings
vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- make indenting smarter again

-- Line settings
-- vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorlineopt = "number" -- set the cursorline
vim.opt.colorcolumn = { "80", "160" } -- set colorcolumn at 80 and 160 characters - standard
vim.opt.textwidth = 79 -- set textwidth at 79 characters to fit within colorcolumn
-- vim.opt.formatoptions:append("a") -- default is "jncroql"
vim.opt.wrap = true -- wrap lines
vim.opt.linebreak = true -- wrap lines at convenient points
vim.opt.breakat = " ^I!@*-+;:,./?" -- wrap lines at these characters
vim.opt.breakindent = true -- wrap lines with indent
vim.opt.showbreak = "↪ " -- show line break at the end with ↪
vim.g.autoformat = true -- autoformat on save

-- Line number settings
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
-- vim.opt.numberwidth = 3 -- set number column width to 3 {default 4}

-- Files settings
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true -- enable persistent undo

-- Suggestion settings
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 100 -- faster completion (4000ms default)

-- Scroll settings
vim.opt.scrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.sidescrolloff = 8 -- Makes sure there are always eight columns of context

-- Ruler settings
vim.opt.ruler = true -- Show the ruler
-- vim.opt.rulerformat = "%-14.(%l,%c%V%) %P" -- Format ruler

-- Window settings
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = [[%t – %{fnamemodify(getcwd(), ':t')}]]
vim.opt.mouse = "a" -- allow the mouse to be used in neovim in all modes
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.fillchars = { eob = " " } -- change the character at the end of buffer instead of \n
vim.opt.showtabline = 1 -- always show tabs
vim.opt.splitbelow = true -- :sp and :sv for read-only - force all horizontal splits to go below current window
vim.opt.splitright = true -- :vs force all vertical splits to go to the right of current window

-- Popup menu settings
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.inccommand = "split" -- Show live preview of :s command

-- Leader key settings
vim.g.mapleader = " " -- change leader to a space
vim.g.maplocalleader = " " -- change localleader to a space

-- Luarocks
-- opts.rocks.enabled = false -- wrong

-- vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp

-- vim.g.loaded_netrw = 1                          -- disable netrw
-- vim.g.loaded_netrwPlugin = 1                    --  disable netrw
