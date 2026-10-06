return {
	"yazi.nvim",
	event = "DeferredUIEnter",
	after = function()
		require("yazi").setup({
			open_for_directories = true,
			keymaps = {
				show_help = "<f1>",
			},
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if arg == "" then
					return
				end
				if vim.fn.isdirectory(arg) == 1 then
					vim.cmd("Yazi " .. vim.fn.fnameescape(arg))
				end
			end,
		})
	end,
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
}
