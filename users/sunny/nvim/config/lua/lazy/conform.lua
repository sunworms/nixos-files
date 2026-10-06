return {
	"conform.nvim",
	event = "BufWritePre",
	after = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "alejandra" },
				go = { "goimports", "gofmt" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
				typst = { "typstyle" },
				tex = { "tex-fmt" },
			},
			format_on_save = { timeout_ms = 500 },
		})
	end,
}
