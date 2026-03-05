vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- General
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.hidden = true
opt.swapfile = false

-- UI
opt.number = true
opt.cursorline = true
opt.signcolumn = 'yes'

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Autoindent
opt.autoindent = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Split
opt.splitbelow = true
opt.splitright = true

-- Set the leader key to the spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("blink.cmp")
require("plugins")
