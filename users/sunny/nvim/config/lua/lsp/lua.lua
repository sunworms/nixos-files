return function(capabilities)
	vim.lsp.config("lua_ls", {
		capabilities = capabilities,
		root_markers = { ".git" },
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				runtime = { version = "LuaJIT" },
			},
		},
	})
	vim.lsp.enable("lua_ls")
end
