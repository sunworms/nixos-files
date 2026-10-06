return function(capabilities)
	vim.lsp.config("gopls", {
		capabilities = capabilities,
		root_markers = { ".git", "go.mod" },
		settings = {
			gopls = {
				analyses = { unusedparams = true },
				staticcheck = true,
			},
		},
	})
	vim.lsp.enable("gopls")
end
