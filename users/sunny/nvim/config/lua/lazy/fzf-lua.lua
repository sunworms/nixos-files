return {
	"fzf-lua",
	cmd = "FzfLua",

	after = function()
		require("fzf-lua").setup()
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").oldfiles()
			end,
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").diagnostics_document()
			end,
		},
	},
}
