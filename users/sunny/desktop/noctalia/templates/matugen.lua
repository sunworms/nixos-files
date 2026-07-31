local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "{{colors.surface.default.hex}}",
		base01 = "{{colors.surface_container.default.hex}}",
		base02 = "{{colors.surface_container_high.default.hex}}",
		base03 = "{{colors.outline.default.hex}}",
		base04 = "{{colors.on_surface_variant.default.hex}}",
		base05 = "{{colors.on_surface.default.hex}}",
		base06 = "{{colors.on_surface.default.hex}}",
		base07 = "{{colors.on_background.default.hex}}",

		base08 = "{{colors.secondary.default.hex}}",
		base09 = "{{colors.tertiary.default.hex}}",
		base0A = "{{colors.tertiary_container.default.hex}}",
		base0B = "{{colors.primary.default.hex}}",
		base0C = "{{colors.tertiary_fixed_dim.default.hex}}",
		base0D = "{{colors.primary_fixed_dim.default.hex}}",
		base0E = "{{colors.secondary_fixed_dim.default.hex}}",
		base0F = "{{colors.source_color.default.hex}}",
	})

	M.setup_treesitter()
end

function M.setup_treesitter()
	local set = vim.api.nvim_set_hl

	set(0, "String", { fg = "{{colors.primary.default.hex}}" })
	set(0, "Identifier", { fg = "{{colors.on_surface.default.hex}}" })
	set(0, "Function", { fg = "{{colors.primary_fixed_dim.default.hex}}", bold = true })
	set(0, "Keyword", { fg = "{{colors.secondary.default.hex}}", italic = true })
	set(0, "Comment", { fg = "{{colors.outline.default.hex}}", italic = true })

	set(0, "@variable", { fg = "{{colors.on_surface.default.hex}}" })
	set(0, "@variable.builtin", { fg = "{{colors.secondary.default.hex}}" })
	set(0, "@property", { fg = "{{colors.tertiary.default.hex}}" })
	set(0, "@parameter", { fg = "{{colors.on_surface_variant.default.hex}}" })

	set(0, "@string.special.url", { fg = "{{colors.tertiary.default.hex}}", underline = true })
	set(0, "@string.path", { fg = "{{colors.primary.default.hex}}" })

	set(0, "Error", { fg = "{{colors.error.default.hex}}" })
	set(0, "@error", { fg = "{{colors.error.default.hex}}" })
	set(0, "DiagnosticError", { fg = "{{colors.error.default.hex}}" })

	set(
		0,
		"Visual",
		{ bg = "{{colors.primary_container.default.hex}}", fg = "{{colors.on_primary_container.default.hex}}" }
	)
end

return M
