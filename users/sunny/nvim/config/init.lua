vim.loader.enable()

-- Diable builtins
local vg = vim.g

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
	"matchparen",
	"editorconfig",
	"osc52",
	"shada",
}

for _, plugin in ipairs(disabled_built_ins) do
	vg["loaded_" .. plugin] = 1
end

-- Set the leader key to space
vg.mapleader = " "
vg.maplocalleader = "\\"
vg.loaded_perl_provider = 0
vg.loaded_ruby_provider = 0
vg.loaded_node_provider = 0
vg.loaded_python3_provider = 0
vg.clipboard = {
	name = "wl-utils",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
	cache_enabled = 1,
}

local opt = vim.opt

-- General
opt.mouse = "a"
opt.hidden = true
opt.swapfile = false
opt.updatetime = 500

-- UI
opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false

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

-- Wrap Lines
opt.whichwrap:append("<,>,h,l,[,]")

local key = vim.keymap

key.set("n", "<leader>y", '"+y')
key.set("v", "<leader>y", '"+y')

key.set("n", "<leader>p", '"+p')
key.set("v", "<leader>p", '"+p')

key.set("n", "<C-h>", "<C-w>h")
key.set("n", "<C-j>", "<C-w>j")
key.set("n", "<C-k>", "<C-w>k")
key.set("n", "<C-l>", "<C-w>l")
key.set("n", "<C-v>", "<C-w>v")

key.set("n", "j", "gj")
key.set("n", "k", "gk")
key.set("n", "<Down>", "gj")
key.set("n", "<Up>", "gk")
key.set("i", "<Down>", "<C-o>gj")
key.set("i", "<Up>", "<C-o>gk")

key.set("n", "<leader><space>", function()
	vim.cmd("nohlsearch")
	vim.fn.clearmatches()
end, { desc = "Clear search highlights and matches", silent = true })

vim.o.winborder = "rounded"

local theme_file = vim.fn.expand("~/.cache/wal/vim-colors.vim")

local function apply_theme()
	if vim.loop.fs_stat(theme_file) then
		vim.cmd.source(theme_file)
	else
		vim.cmd.colorscheme("catppuccin")
	end
end

vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = apply_theme,
})

local signal = vim.uv.new_signal()
signal:start(
	"sigusr1",
	vim.schedule_wrap(function()
		package.loaded["mini.statusline"] = nil
		apply_theme()
		require("mini.statusline").setup()
	end)
)

vim.cmd.colorscheme("catppuccin-nvim")

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start(args.buf, lang)
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo[0][0].foldmethod = "expr"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.treesitter.stop()
	end,
})
opt.foldenable = false

require("lz.n").load("lazy")
