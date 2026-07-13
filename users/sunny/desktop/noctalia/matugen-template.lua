local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		-- Background tones: Increased contrast between surface steps
		base00 = "{{colors.surface.default.hex}}", -- Default Background
		base01 = "{{colors.surface_container.default.hex}}", -- Lighter Background (Status lines)
		base02 = "{{colors.surface_container_high.default.hex}}", -- Selection/Highlight
		base03 = "{{colors.outline.default.hex}}", -- Comments, Invisibles

		-- Foreground tones
		base04 = "{{colors.on_surface_variant.default.hex}}", -- Dark Foreground
		base05 = "{{colors.on_surface.default.hex}}", -- Default Foreground
		base06 = "{{colors.surface_bright.default.hex}}", -- Light Foreground
		base07 = "{{colors.on_primary_container.default.hex}}", -- Lightest Foreground

		-- Accent colors: Swapped "Container" for "Primary/Secondary/Tertiary" for better readability
		base08 = "{{colors.error.default.hex}}", -- Variables, Errors
		base09 = "{{colors.tertiary.default.hex}}", -- Integers, Constants
		base0A = "{{colors.secondary.default.hex}}", -- Classes
		base0B = "{{colors.primary.default.hex}}", -- Strings
		base0C = "{{colors.primary_fixed.default.hex}}", -- Regex (Fixed colors offer stable contrast)
		base0D = "{{colors.primary.default.hex}}", -- Functions
		base0E = "{{colors.secondary.default.hex}}", -- Keywords
		base0F = "{{colors.outline_variant.default.hex}}", -- Deprecated
	})

	-- Helper function to set multiple highlight groups
	local function set_hl_multiple(groups, value)
		for _, v in pairs(groups) do
			vim.api.nvim_set_hl(0, v, value)
		end
	end

	-- CursorLine: Make the current line distinct but not overwhelming
	vim.api.nvim_set_hl(0, "CursorLine", {
		bg = "{{colors.surface_container_highest.default.hex}}",
	})

	-- Visual: Higher contrast for selection
	vim.api.nvim_set_hl(0, "Visual", {
		bg = "{{colors.secondary_container.default.hex}}",
		fg = "{{colors.on_secondary_container.default.hex}}",
	})

	-- Keywords: Use Primary for maximum visibility on logic
	set_hl_multiple({ "Keyword", "TSKeyword", "TSRepeat", "Statement" }, {
		fg = "{{colors.primary.default.hex}}",
		bold = true,
	})

	-- Comments: Use 'on_surface_variant' for a "greyed out" look that is still legible
	set_hl_multiple({ "Comment", "TSComment" }, {
		fg = "{{colors.on_surface_variant.default.hex}}",
		italic = true,
	})

	-- Functions: Secondary looks great for logic blocks
	set_hl_multiple({ "Function", "TSFunction", "Method", "TSMethod" }, {
		fg = "{{colors.secondary.default.hex}}",
	})
end

return M
