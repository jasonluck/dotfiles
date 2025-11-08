-- Set tabs to 2 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Enable auto indenting
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.breakindent = true

-- Map leader key to Space
vim.g.mapleader = " "

-- Line numbers and Relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable persistent undo history
vim.opt.undofile = true

-- Hightlight the line our cursor is on
vim.opt.cursorline = true

-- Keep 8 lines above/below cursor as we scroll
vim.opt.scrolloff = 8

-- Place a line at our soft column limit
vim.opt.colorcolumn = "80"

-- Always show sign column to stop buffer shift
vim.opt.signcolumn = "yes"

-- Set the conceal level
-- This needs to be 1 or 2 in order for the obsidian plugin
-- to work properly
vim.opt.conceallevel = 2
