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
		base08 = "{{colors.error.default.hex}}",
		base09 = "{{colors.tertiary.default.hex}}",
		base0A = "{{colors.secondary.default.hex}}",
		base0B = "{{colors.primary.default.hex}}",
		base0C = "{{colors.tertiary_fixed_dim.default.hex}}",
		base0D = "{{colors.primary_fixed_dim.default.hex}}",
		base0E = "{{colors.secondary_fixed_dim.default.hex}}",
		base0F = "{{colors.error_container.default.hex}}",
	})

	local function set_hl_multiple(groups, value)
		for _, v in pairs(groups) do
			vim.api.nvim_set_hl(0, v, value)
		end
	end

	vim.api.nvim_set_hl(0, "CursorLine", {
		bg = "{{colors.surface_container_highest.default.hex}}",
	})

	vim.api.nvim_set_hl(0, "Visual", {
		bg = "{{colors.secondary_container.default.hex}}",
		fg = "{{colors.on_secondary_container.default.hex}}",
	})

	set_hl_multiple({ "Keyword", "TSKeyword", "TSKeywordFunction", "TSRepeat", "Statement" }, {
		fg = "{{colors.primary.default.hex}}",
		bold = true,
	})

	set_hl_multiple({ "Comment", "TSComment" }, {
		fg = "{{colors.on_surface_variant.default.hex}}",
		italic = true,
	})

	set_hl_multiple({ "Function", "TSFunction", "Method", "TSMethod" }, {
		fg = "{{colors.secondary.default.hex}}",
	})

	set_hl_multiple({ "String", "TSString" }, {
		fg = "{{colors.tertiary.default.hex}}",
	})

	set_hl_multiple({ "Number", "Float", "Boolean", "Constant", "TSConstant" }, {
		fg = "{{colors.tertiary_fixed.default.hex}}",
	})

	set_hl_multiple({ "Type", "TSType", "Structure" }, {
		fg = "{{colors.secondary_fixed.default.hex}}",
	})

	set_hl_multiple({ "DiagnosticError", "ErrorMsg" }, {
		fg = "{{colors.error.default.hex}}",
	})

	set_hl_multiple({ "DiagnosticWarn", "WarningMsg" }, {
		fg = "{{colors.secondary_fixed_dim.default.hex}}",
	})

	set_hl_multiple({ "DiagnosticInfo", "DiagnosticHint" }, {
		fg = "{{colors.primary_fixed_dim.default.hex}}",
	})
end

return M
