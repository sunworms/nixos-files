vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- General
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.hidden = true
opt.swapfile = false
opt.updatetime = 500

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

vim.o.winborder = 'rounded'

require('matugen').setup()
require('oil').setup()
require('lualine').setup({})
require('nvim-autopairs').setup()
require('nvim-treesitter').setup()

local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins"

local plugins = {}
local files = vim.fn.readdir(plugins_path)

for _, file in ipairs(files) do
    if file:match("%.lua$") then
        local module_name = "plugins." .. file:gsub("%.lua$", "")
        local spec = require(module_name)
        table.insert(plugins, spec)
    end
end

require("lz.n").load(plugins)
