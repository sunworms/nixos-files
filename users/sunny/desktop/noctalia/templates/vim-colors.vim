" ==========================================================================
" Reset
" ==========================================================================
hi clear
if exists("syntax_on")
  syntax reset
endif
set background=dark

" ==========================================================================
" Terminal Colors (g:terminal_color_x)
" ==========================================================================
if has('nvim')
  let g:terminal_color_0  = "{{ colors.terminal_normal_black.default.hex }}"
  let g:terminal_color_1  = "{{ colors.terminal_normal_red.default.hex }}"
  let g:terminal_color_2  = "{{ colors.terminal_normal_green.default.hex }}"
  let g:terminal_color_3  = "{{ colors.terminal_normal_yellow.default.hex }}"
  let g:terminal_color_4  = "{{ colors.terminal_normal_blue.default.hex }}"
  let g:terminal_color_5  = "{{ colors.terminal_normal_magenta.default.hex }}"
  let g:terminal_color_6  = "{{ colors.terminal_normal_cyan.default.hex }}"
  let g:terminal_color_7  = "{{ colors.terminal_normal_white.default.hex }}"
  let g:terminal_color_8  = "{{ colors.terminal_bright_black.default.hex }}"
  let g:terminal_color_9  = "{{ colors.terminal_bright_red.default.hex }}"
  let g:terminal_color_10 = "{{ colors.terminal_bright_green.default.hex }}"
  let g:terminal_color_11 = "{{ colors.terminal_bright_yellow.default.hex }}"
  let g:terminal_color_12 = "{{ colors.terminal_bright_blue.default.hex }}"
  let g:terminal_color_13 = "{{ colors.terminal_bright_magenta.default.hex }}"
  let g:terminal_color_14 = "{{ colors.terminal_bright_cyan.default.hex }}"
  let g:terminal_color_15 = "{{ colors.terminal_bright_white.default.hex }}"
endif

" ==========================================================================
" Core editor surface
" ==========================================================================
hi Normal        guibg=NONE guifg={{ colors.on_background.default.hex }}
hi NormalNC      guibg=NONE guifg={{ colors.on_background.default.hex }}
hi EndOfBuffer   guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi NonText       guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi SpecialKey    guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi Whitespace    guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi Conceal       guibg=NONE guifg={{ colors.outline.default.hex }}
hi Cursor        guibg={{ colors.primary.default.hex }} guifg={{ colors.on_primary.default.hex }}
hi lCursor       guibg={{ colors.primary.default.hex }} guifg={{ colors.on_primary.default.hex }}
hi CursorIM      guibg={{ colors.primary.default.hex }} guifg={{ colors.on_primary.default.hex }}

hi CursorLine    guibg={{ colors.surface_container_low.default.hex }} guifg=NONE
hi CursorColumn  guibg={{ colors.surface_container_low.default.hex }} guifg=NONE
hi ColorColumn   guibg={{ colors.surface_container_low.default.hex }} guifg=NONE
hi MatchParen    guibg={{ colors.primary_container.default.hex }} guifg={{ colors.on_primary_container.default.hex }} gui=bold

hi LineNr        guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi CursorLineNr  guibg=NONE guifg={{ colors.primary.default.hex }} gui=bold
hi SignColumn    guibg=NONE guifg={{ colors.outline.default.hex }}
hi FoldColumn    guibg=NONE guifg={{ colors.outline.default.hex }}
hi Folded        guibg={{ colors.surface_container_low.default.hex }} guifg={{ colors.outline.default.hex }} gui=italic

hi Visual        guibg={{ colors.surface_container_highest.default.hex }} guifg=NONE
hi VisualNOS     guibg={{ colors.surface_container_highest.default.hex }} guifg=NONE
hi Selection     guibg={{ colors.surface_container_highest.default.hex }} guifg={{ colors.on_surface.default.hex }}

hi Title         guibg=NONE guifg={{ colors.primary.default.hex }} gui=bold
hi Directory     guibg=NONE guifg={{ colors.primary.default.hex }}

" ==========================================================================
" Search
" ==========================================================================
hi Search        guibg={{ colors.secondary_container.default.hex }} guifg={{ colors.on_secondary_container.default.hex }}
hi IncSearch     guibg={{ colors.tertiary_container.default.hex }} guifg={{ colors.on_tertiary_container.default.hex }} gui=bold
hi CurSearch     guibg={{ colors.tertiary_container.default.hex }} guifg={{ colors.on_tertiary_container.default.hex }} gui=bold
hi QuickFixLine  guibg={{ colors.surface_container_high.default.hex }} guifg=NONE gui=bold

" ==========================================================================
" Status line, tabs, windows
" ==========================================================================
hi StatusLine    guibg=NONE guifg={{ colors.on_surface.default.hex }}
hi StatusLineNC  guibg=NONE guifg={{ colors.outline.default.hex }}
hi VertSplit     guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi TabLine       guibg={{ colors.surface_container.default.hex }} guifg={{ colors.on_surface_variant.default.hex }}
hi TabLineSel    guibg={{ colors.primary.default.hex }} guifg={{ colors.on_primary.default.hex }} gui=bold
hi TabLineFill   guibg={{ colors.surface_container_low.default.hex }} guifg=NONE
hi WildMenu      guibg={{ colors.primary_container.default.hex }} guifg={{ colors.on_primary_container.default.hex }}

" ==========================================================================
" Popup / completion menu
" ==========================================================================
hi Pmenu         guibg={{ colors.surface_container.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi PmenuSel      guibg={{ colors.primary_container.default.hex }} guifg={{ colors.on_primary_container.default.hex }} gui=bold
hi PmenuKind     guibg={{ colors.surface_container.default.hex }} guifg={{ colors.tertiary.default.hex }}
hi PmenuKindSel  guibg={{ colors.primary_container.default.hex }} guifg={{ colors.tertiary.default.hex }}
hi PmenuExtra    guibg={{ colors.surface_container.default.hex }} guifg={{ colors.outline.default.hex }}
hi PmenuExtraSel guibg={{ colors.primary_container.default.hex }} guifg={{ colors.on_primary_container.default.hex }}
hi PmenuMatch    guibg={{ colors.surface_container.default.hex }} guifg={{ colors.primary.default.hex }} gui=bold
hi PmenuMatchSel guibg={{ colors.primary_container.default.hex }} guifg={{ colors.primary.default.hex }} gui=bold
hi PmenuSbar     guibg={{ colors.surface_container_high.default.hex }}
hi PmenuThumb    guibg={{ colors.outline.default.hex }}

" ==========================================================================
" Diff
" ==========================================================================
hi DiffAdd       guibg={{ colors.secondary_container.default.hex }} guifg={{ colors.on_secondary_container.default.hex }}
hi DiffChange    guibg={{ colors.tertiary_container.default.hex }} guifg={{ colors.on_tertiary_container.default.hex }}
hi DiffDelete    guibg={{ colors.error_container.default.hex }} guifg={{ colors.on_error_container.default.hex }}
hi DiffText      guibg={{ colors.primary_container.default.hex }} guifg={{ colors.on_primary_container.default.hex }} gui=bold
hi link Added    DiffAdd
hi link Changed  DiffChange
hi link Removed  DiffDelete

" ==========================================================================
" Spelling
" ==========================================================================
hi SpellBad      guisp={{ colors.error.default.hex }} gui=undercurl guifg=NONE guibg=NONE
hi SpellCap      guisp={{ colors.tertiary.default.hex }} gui=undercurl guifg=NONE guibg=NONE
hi SpellLocal    guisp={{ colors.secondary.default.hex }} gui=undercurl guifg=NONE guibg=NONE
hi SpellRare     guisp={{ colors.primary.default.hex }} gui=undercurl guifg=NONE guibg=NONE

" ==========================================================================
" Messages / prompts
" ==========================================================================
hi Error         guibg={{ colors.error_container.default.hex }} guifg={{ colors.on_error_container.default.hex }}
hi ErrorMsg      guibg=NONE guifg={{ colors.error.default.hex }}
hi WarningMsg    guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi ModeMsg       guibg=NONE guifg={{ colors.primary.default.hex }} gui=bold
hi MoreMsg       guibg=NONE guifg={{ colors.primary.default.hex }}
hi Question      guibg=NONE guifg={{ colors.primary.default.hex }}

" ==========================================================================
" :terminal buffers
" ==========================================================================
hi Terminal      guibg={{ colors.terminal_background.default.hex }} guifg={{ colors.terminal_foreground.default.hex }}

" ==========================================================================
" Legacy Syntax Highlighting
" ==========================================================================
hi Comment        guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic

hi Constant       guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi String         guibg=NONE guifg={{ colors.secondary.default.hex }}
hi Character      guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi Number         guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi Boolean        guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi Float          guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}

hi Identifier     guibg=NONE guifg={{ colors.on_surface_variant.default.hex }}
hi Function       guibg=NONE guifg={{ colors.primary.default.hex }}

hi Statement      guibg=NONE guifg={{ colors.primary.default.hex }} gui=bold
hi Conditional    guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi Repeat         guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi Label          guibg=NONE guifg={{ colors.secondary.default.hex }}
hi Operator       guibg=NONE guifg={{ colors.outline.default.hex }}
hi Keyword        guibg=NONE guifg={{ colors.primary_fixed_dim.default.hex }} gui=bold
hi Exception      guibg=NONE guifg={{ colors.error.default.hex }} gui=bold

hi PreProc        guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi Include        guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi Define         guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi Macro          guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi PreCondit      guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}

hi Type           guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi StorageClass   guibg=NONE guifg={{ colors.primary.default.hex }}
hi Structure      guibg=NONE guifg={{ colors.secondary.default.hex }}
hi Typedef        guibg=NONE guifg={{ colors.tertiary_fixed_dim.default.hex }}

hi Special        guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi SpecialChar    guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi Tag            guibg=NONE guifg={{ colors.primary.default.hex }}
hi Delimiter      guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi SpecialComment guibg=NONE guifg={{ colors.on_surface_variant.default.hex }} gui=italic
hi Debug          guibg=NONE guifg={{ colors.error.default.hex }}

hi Underlined     gui=underline guifg={{ colors.primary.default.hex }}
hi Ignore         guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi Todo           guibg=NONE guifg={{ colors.error.default.hex }} gui=bold,underline

" ==========================================================================
" Neovim Specific Section
" ==========================================================================
if has('nvim')

" --------------------------------------------------------------------------
" Floating windows & UI separators
" --------------------------------------------------------------------------
hi NormalFloat   guibg={{ colors.surface_container.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi FloatBorder   guibg={{ colors.surface_container.default.hex }} guifg={{ colors.outline.default.hex }}
hi FloatTitle    guibg={{ colors.surface_container.default.hex }} guifg={{ colors.primary.default.hex }} gui=bold
hi WinSeparator  guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi WinBar        guibg=NONE guifg={{ colors.on_surface_variant.default.hex }}
hi WinBarNC      guibg=NONE guifg={{ colors.outline.default.hex }}

" --------------------------------------------------------------------------
" Native diagnostics
" --------------------------------------------------------------------------
hi DiagnosticError guibg=NONE guifg={{ colors.error.default.hex }}
hi DiagnosticWarn  guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi DiagnosticInfo  guibg=NONE guifg={{ colors.secondary.default.hex }}
hi DiagnosticHint  guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic
hi DiagnosticOk    guibg=NONE guifg={{ colors.secondary.default.hex }}

hi DiagnosticVirtualTextError guibg={{ colors.error_container.default.hex }}     guifg={{ colors.on_error_container.default.hex }}
hi DiagnosticVirtualTextWarn  guibg={{ colors.tertiary_container.default.hex }}  guifg={{ colors.on_tertiary_container.default.hex }}
hi DiagnosticVirtualTextInfo  guibg={{ colors.secondary_container.default.hex }} guifg={{ colors.on_secondary_container.default.hex }}
hi DiagnosticVirtualTextHint  guibg={{ colors.surface_container_low.default.hex }} guifg={{ colors.on_surface_variant.default.hex }}
hi DiagnosticVirtualTextOk    guibg={{ colors.secondary_container.default.hex }} guifg={{ colors.on_secondary_container.default.hex }}

hi DiagnosticUnderlineError guisp={{ colors.error.default.hex }}     gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineWarn  guisp={{ colors.tertiary.default.hex }}  gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineInfo  guisp={{ colors.secondary.default.hex }} gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineHint  guisp={{ colors.outline.default.hex }}   gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineOk    guisp={{ colors.secondary.default.hex }} gui=undercurl guifg=NONE guibg=NONE

hi DiagnosticFloatingError guibg={{ colors.surface_container.default.hex }} guifg={{ colors.error.default.hex }}
hi DiagnosticFloatingWarn  guibg={{ colors.surface_container.default.hex }} guifg={{ colors.tertiary.default.hex }}
hi DiagnosticFloatingInfo  guibg={{ colors.surface_container.default.hex }} guifg={{ colors.secondary.default.hex }}
hi DiagnosticFloatingHint  guibg={{ colors.surface_container.default.hex }} guifg={{ colors.outline.default.hex }}
hi DiagnosticFloatingOk    guibg={{ colors.surface_container.default.hex }} guifg={{ colors.secondary.default.hex }}

hi DiagnosticSignError guibg=NONE guifg={{ colors.error.default.hex }}
hi DiagnosticSignWarn  guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi DiagnosticSignInfo  guibg=NONE guifg={{ colors.secondary.default.hex }}
hi DiagnosticSignHint  guibg=NONE guifg={{ colors.outline.default.hex }}
hi DiagnosticSignOk    guibg=NONE guifg={{ colors.secondary.default.hex }}

hi DiagnosticDeprecated gui=strikethrough guifg={{ colors.outline.default.hex }} guibg=NONE
hi DiagnosticUnnecessary guifg={{ colors.outline.default.hex }} guibg=NONE

" --------------------------------------------------------------------------
" Treesitter highlight groups
" --------------------------------------------------------------------------

" Variables & Identifiers
hi @variable                    guibg=NONE guifg={{ colors.on_surface.default.hex }}
hi @variable.builtin            guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=italic
hi @variable.parameter          guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @variable.parameter.builtin  guibg=NONE guifg={{ colors.secondary.default.hex }} gui=italic
hi @variable.member             guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}

" Constants
hi @constant         guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @constant.builtin guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @constant.macro   guibg=NONE guifg={{ colors.tertiary.default.hex }}

" Strings, characters, numbers
hi @string                guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @string.documentation  guibg=NONE guifg={{ colors.secondary.default.hex }} gui=italic
hi @string.regexp         guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @string.escape         guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @string.special        guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @string.special.symbol guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @string.special.url    guibg=NONE guifg={{ colors.primary.default.hex }} gui=underline
hi @character             guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @character.special     guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @number                guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @number.float          guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @boolean               guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @float                 guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}

" Functions
hi @function             guibg=NONE guifg={{ colors.primary.default.hex }}
hi @function.builtin     guibg=NONE guifg={{ colors.primary.default.hex }} gui=italic
hi @function.call        guibg=NONE guifg={{ colors.primary.default.hex }}
hi @function.macro       guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @function.method      guibg=NONE guifg={{ colors.primary.default.hex }}
hi @function.method.call guibg=NONE guifg={{ colors.primary.default.hex }}
hi @constructor          guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }} gui=bold

" Keywords / control flow
hi @keyword             guibg=NONE guifg={{ colors.primary_fixed_dim.default.hex }} gui=bold
hi @keyword.function    guibg=NONE guifg={{ colors.primary_fixed_dim.default.hex }} gui=bold
hi @keyword.operator    guibg=NONE guifg={{ colors.outline.default.hex }}
hi @keyword.return      guibg=NONE guifg={{ colors.primary_fixed_dim.default.hex }} gui=bold
hi @keyword.import      guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @keyword.repeat      guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @keyword.conditional guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @keyword.exception   guibg=NONE guifg={{ colors.error.default.hex }} gui=bold
hi @keyword.directive   guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi @keyword.modifier    guibg=NONE guifg={{ colors.primary.default.hex }}
hi @keyword.coroutine   guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold

" Types & Attributes
hi @type            guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @type.builtin    guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }} gui=italic
hi @type.definition guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }} gui=bold
hi @storageclass    guibg=NONE guifg={{ colors.primary.default.hex }}
hi @attribute       guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi @attribute.builtin guibg=NONE guifg={{ colors.secondary_fixed.default.hex }} gui=italic
hi @property        guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @field           guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @namespace       guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi @module          guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}

" Punctuation
hi @punctuation.delimiter guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi @punctuation.bracket   guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi @punctuation.special   guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}

" Comments
hi @comment               guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic
hi @comment.documentation guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic
hi @comment.error         guibg=NONE guifg={{ colors.error.default.hex }} gui=bold
hi @comment.warning       guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @comment.todo          guibg=NONE guifg={{ colors.error.default.hex }} gui=bold,underline
hi @comment.note          guibg=NONE guifg={{ colors.secondary.default.hex }} gui=bold

" Markup / Prose
hi @markup.strong        gui=bold
hi @markup.italic        gui=italic
hi @markup.strikethrough gui=strikethrough
hi @markup.underline     gui=underline
hi @markup.heading       guibg=NONE guifg={{ colors.primary.default.hex }} gui=bold
hi @markup.heading.1     guibg=NONE guifg={{ colors.primary.default.hex }} gui=bold
hi @markup.heading.2     guibg=NONE guifg={{ colors.secondary.default.hex }} gui=bold
hi @markup.heading.3     guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=bold
hi @markup.heading.4     guibg=NONE guifg={{ colors.primary_fixed_dim.default.hex }} gui=bold
hi @markup.heading.5     guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }} gui=bold
hi @markup.heading.6     guibg=NONE guifg={{ colors.tertiary_fixed_dim.default.hex }} gui=bold
hi @markup.quote         guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic
hi @markup.math          guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @markup.link          guibg=NONE guifg={{ colors.primary.default.hex }} gui=underline
hi @markup.link.label    guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @markup.link.url      guibg=NONE guifg={{ colors.primary.default.hex }} gui=underline
hi @markup.raw           guibg={{ colors.surface_container_low.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi @markup.raw.block     guibg={{ colors.surface_container_low.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi @markup.list          guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @markup.list.checked  guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @markup.list.unchecked guibg=NONE guifg={{ colors.outline.default.hex }}

" Tags (HTML / JSX / XML)
hi @tag           guibg=NONE guifg={{ colors.primary.default.hex }}
hi @tag.attribute guibg=NONE guifg={{ colors.secondary.default.hex }} gui=italic
hi @tag.delimiter guibg=NONE guifg={{ colors.outline_variant.default.hex }}

" Diff captures
hi @diff.plus  guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @diff.minus guibg=NONE guifg={{ colors.error.default.hex }}
hi @diff.delta guibg=NONE guifg={{ colors.tertiary.default.hex }}

" --------------------------------------------------------------------------
" Native Neovim LSP Semantic Tokens (@lsp.type.*)
" --------------------------------------------------------------------------
hi @lsp.type.class         guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @lsp.type.comment       guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic
hi @lsp.type.enum          guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @lsp.type.enumMember    guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @lsp.type.function      guibg=NONE guifg={{ colors.primary.default.hex }}
hi @lsp.type.interface     guibg=NONE guifg={{ colors.tertiary.default.hex }} gui=italic
hi @lsp.type.keyword       guibg=NONE guifg={{ colors.primary_fixed_dim.default.hex }} gui=bold
hi @lsp.type.macro         guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi @lsp.type.method        guibg=NONE guifg={{ colors.primary.default.hex }}
hi @lsp.type.namespace     guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi @lsp.type.number        guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @lsp.type.operator      guibg=NONE guifg={{ colors.outline.default.hex }}
hi @lsp.type.parameter     guibg=NONE guifg={{ colors.secondary.default.hex }}
hi @lsp.type.property      guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi @lsp.type.struct        guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @lsp.type.type          guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi @lsp.type.variable      guibg=NONE guifg={{ colors.on_surface.default.hex }}

" --------------------------------------------------------------------------
" Plugin Support
" --------------------------------------------------------------------------

" GitSigns
hi GitSignsAdd    guibg=NONE guifg={{ colors.secondary.default.hex }}
hi GitSignsChange guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi GitSignsDelete guibg=NONE guifg={{ colors.error.default.hex }}

" Telescope / FZF-Lua / Snacks Picker
hi TelescopeNormal          guibg={{ colors.surface_container.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi TelescopeBorder          guibg={{ colors.surface_container.default.hex }} guifg={{ colors.outline.default.hex }}
hi TelescopePromptNormal    guibg={{ colors.surface_container_high.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi TelescopePromptBorder    guibg={{ colors.surface_container_high.default.hex }} guifg={{ colors.surface_container_high.default.hex }}
hi TelescopePromptTitle     guibg={{ colors.primary.default.hex }} guifg={{ colors.on_primary.default.hex }} gui=bold
hi TelescopeSelection       guibg={{ colors.surface_container_highest.default.hex }} guifg={{ colors.on_surface.default.hex }}
hi TelescopeSelectionCaret  guibg={{ colors.surface_container_highest.default.hex }} guifg={{ colors.primary.default.hex }}

" Completion (nvim-cmp & blink.cmp)
hi CmpItemAbbrDeprecated gui=strikethrough guifg={{ colors.outline.default.hex }}
hi CmpItemAbbrMatch      guifg={{ colors.primary.default.hex }} gui=bold
hi CmpItemAbbrMatchFuzzy guifg={{ colors.primary.default.hex }} gui=bold
hi CmpItemKind           guifg={{ colors.tertiary.default.hex }}
hi CmpItemMenu           guifg={{ colors.outline.default.hex }}

hi BlinkCmpItemAbbrDeprecated gui=strikethrough guifg={{ colors.outline.default.hex }}
hi BlinkCmpItemAbbrMatch      guifg={{ colors.primary.default.hex }} gui=bold
hi BlinkCmpItemKind           guifg={{ colors.tertiary.default.hex }}

" Indent Blankline (ibl)
hi IblIndent guifg={{ colors.surface_container_high.default.hex }} gui=nocombine
hi IblScope  guifg={{ colors.outline.default.hex }} gui=nocombine

endif
