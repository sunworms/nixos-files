return function(capabilities)
	vim.lsp.config("tinymist", {
		capabilities = capabilities,
		root_markers = { ".git" },
	})
	vim.lsp.enable("tinymist")
end
