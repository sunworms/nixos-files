-- Set the leader key to the spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_clipboard_provider = 1
vim.g.clipboard = {
  name = 'unnamedplus',
  copy = { ['+'] = 'wl-copy', ['*'] = 'wl-copy' }, -- or xclip
  paste = { ['+'] = 'wl-paste', ['*'] = 'wl-paste' },
  cache_enabled = 0,
}

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

-- No ShaDa
opt.shadafile = "NONE"

vim.o.winborder = 'rounded'

local disabled_built_ins = {
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "gzip",
   "zip",
   "zipPlugin",
   "tar",
   "tarPlugin",
   "getscript",
   "getscriptPlugin",
   "vimball",
   "vimballPlugin",
   "2html_plugin",
   "logipat",
   "rrhelper",
   "spellfile_plugin",
   "matchit",
}

for _, plugin in ipairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end

local status, matugen = pcall(require, 'matugen')
if status then
    matugen.setup()
        
    local signal = vim.uv.new_signal()
    signal:start('sigusr1', vim.schedule_wrap(function()
        package.loaded['matugen'] = nil
        package.loaded['lualine'] = nil
        require('matugen').setup()
        require('lualine').setup({ options = { theme = "base16" } })
    end))
end

local plugins = {
  require("plugins.extra"),
  require("plugins.blink"),
  require("plugins.lsp"),
  require("plugins.telescope"),
  require("plugins.typst-preview"),
  require("plugins.conform"),
}

require("lz.n").load(plugins)
