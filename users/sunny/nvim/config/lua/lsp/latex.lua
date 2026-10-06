return function(capabilities)
	vim.lsp.config("texlab", {
		capabilities = capabilities,
		root_markers = { ".git" },
	})
	vim.lsp.enable("texlab")
end
