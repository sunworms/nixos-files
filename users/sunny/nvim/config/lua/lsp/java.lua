return function(capabilities)
	vim.lsp.config("jdtls", {
		capabilities = capabilities,
		root_markers = { ".git" },
	})
	vim.lsp.enable("jdtls")
end
