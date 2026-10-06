return {
	"typst-preview.nvim",
	ft = "typst",
	after = function()
		require("typst-preview").setup({
			invert_colors = "auto",
			dependencies_bin = {
				["tinymist"] = "tinymist",
				["websocat"] = "websocat",
			},
		})
	end,
}
