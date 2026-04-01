-- Set the leader key to the spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("matugen")

require("lz.n").load({
  {
    "lualine-nvim",
    event = "DeferredUIEnter",
    after = function()
      require("plugins.extra")()
    end
  },
  {
    "blink.cmp",
    event = "BufReadPre",
    after = function()
      require("plugins.blink")
    end,
  },
  {
    "nvim-lspconfig",
    event = "BufReadPost",
    after = function()
      require("plugins.lsp")
    end,
  },
  {
    "telescope.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("plugins.telescope") 
    end,
  },
  {
    "typst-preview.nvim",
    ft = "typst",
    after = function()
      require("plugins.typst-preview")
    end,
  },
  {
    "conform.nvim",
    event = "BufWritePre",
    after = function()
      require("plugins.conform")
    end,
  },
})

local signal = vim.uv.new_signal()
signal:start(
    'sigusr1',
    vim.schedule_wrap(function()
        package.loaded['lualine'] = nil
        package.loaded['matugen'] = nil
        require("matugen")
        require('lualine').setup({ options = { theme = "base16" } })
    end)
)
