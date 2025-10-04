-- Basic editor settings
local opt = vim.opt

-- Line numbers (disabled for clean UI)
opt.number = false
opt.relativenumber = false

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Hide command line and ruler for minimal UI
opt.cmdheight = 0       -- Hide command line
opt.ruler = false       -- Hide line/column info
opt.showcmd = false     -- Hide command in bottom right
opt.showmode = false    -- Hide mode (INSERT, NORMAL, etc.)

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Undo
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Update time for better UX
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Mouse
opt.mouse = "a"

-- Better display for special characters and ligatures
opt.conceallevel = 0
opt.list = false -- Don't show invisible characters by default
