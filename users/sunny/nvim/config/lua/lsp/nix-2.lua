return function(capabilities)
	vim.lsp.config("nil_ls", {
		capabilities = capabilities,
		root_markers = { ".git" },
		settings = {
			["nil"] = {
				nix = {
					flake = {
						autoArchive = true,
					},
				},
			},
		},
	})
	vim.lsp.enable("nil_ls")
end
