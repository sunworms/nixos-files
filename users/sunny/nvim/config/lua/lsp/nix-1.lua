return function(capabilities)
	vim.lsp.config("nixd", {
		capabilities = capabilities,
		root_markers = { ".git" },
	})
	vim.lsp.enable("nixd")
end
