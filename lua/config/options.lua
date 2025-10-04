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

-- LSP and hover behavior
opt.updatetime = 250        -- Faster hover (default 4000ms)
opt.timeoutlen = 500        -- Faster key sequence timeout
opt.completeopt = { "menu", "menuone", "noselect", "preview" }

-- Enhanced completion behavior for better documentation display
opt.pumheight = 15          -- Completion popup height
opt.pumwidth = 50          -- Completion popup width
opt.winblend = 10          -- Slight transparency for floating windows

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
