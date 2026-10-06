return function(capabilities)
	vim.lsp.config("rust_analyzer", {
		capabilities = capabilities,
		root_markers = { ".git", "Cargo.toml" },
		settings = {
			["rust-analyzer"] = {
				checkOnSave = { command = "clippy" },
			},
		},
	})
	vim.lsp.enable("rust_analyzer")
end
