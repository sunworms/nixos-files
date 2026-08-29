" ==========================================================================
" Reset
" ==========================================================================
hi clear
if exists("syntax_on")
  syntax reset
endif
set background=dark

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

hi Visual        guibg={{ colors.terminal_selection_bg.default.hex }} guifg={{ colors.terminal_selection_fg.default.hex }}
hi VisualNOS     guibg={{ colors.terminal_selection_bg.default.hex }} guifg={{ colors.terminal_selection_fg.default.hex }}
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
hi StatusLine    guibg={{ colors.primary.default.hex }} guifg={{ colors.on_primary.default.hex }}
hi StatusLineNC  guibg={{ colors.primary_container.default.hex }} guifg={{ colors.on_primary_container.default.hex }}
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
" vim-lsp diagnostics (see :h vim-lsp-diagnostics / :h vim-lsp-semantic)
" Note: semantic-token colors are controlled by per-server scope mappings,
" not by this file - see :LspSemanticScopes to check/link those separately.
" ==========================================================================
hi LspErrorText           guibg=NONE guifg={{ colors.error.default.hex }}
hi LspErrorLine           guibg={{ colors.error_container.default.hex }} guifg=NONE
hi LspWarningText         guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi LspWarningLine         guibg={{ colors.tertiary_container.default.hex }} guifg=NONE
hi LspInformationText     guibg=NONE guifg={{ colors.secondary.default.hex }}
hi LspInformationLine     guibg={{ colors.secondary_container.default.hex }} guifg=NONE
hi LspHintText            guibg=NONE guifg={{ colors.outline.default.hex }} gui=italic
hi LspHintLine            guibg={{ colors.surface_container_low.default.hex }} guifg=NONE
hi link LspErrorVirtualText       LspErrorText
hi link LspWarningVirtualText     LspWarningText
hi link LspInformationVirtualText LspInformationText
hi link LspHintVirtualText        LspHintText
hi lspReference           guibg={{ colors.surface_container_high.default.hex }} guifg=NONE

" ==========================================================================
" :terminal buffers
" ==========================================================================
hi Terminal      guibg={{ colors.terminal_background.default.hex }} guifg={{ colors.terminal_foreground.default.hex }}

" ==========================================================================
" Syntax highlighting
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
hi Conditional    guibg=NONE guifg={{ colors.tertiary_container.default.hex }} gui=bold
hi Repeat         guibg=NONE guifg={{ colors.tertiary_container.default.hex }} gui=bold
hi Label          guibg=NONE guifg={{ colors.secondary.default.hex }}
hi Operator       guibg=NONE guifg={{ colors.outline.default.hex }}
hi Keyword        guibg=NONE guifg={{ colors.primary_fixed.default.hex }} gui=bold
hi Exception      guibg=NONE guifg={{ colors.error.default.hex }} gui=bold

hi PreProc        guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi Include        guibg=NONE guifg={{ colors.secondary_container.default.hex }}
hi Define         guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}
hi Macro          guibg=NONE guifg={{ colors.tertiary.default.hex }}
hi PreCondit      guibg=NONE guifg={{ colors.secondary_fixed.default.hex }}

hi Type           guibg=NONE guifg={{ colors.tertiary_fixed.default.hex }}
hi StorageClass   guibg=NONE guifg={{ colors.primary.default.hex }}
hi Structure      guibg=NONE guifg={{ colors.secondary.default.hex }}
hi Typedef        guibg=NONE guifg={{ colors.tertiary_fixed_dim.default.hex }}

hi Special        guibg=NONE guifg={{ colors.secondary_fixed_dim.default.hex }}
hi SpecialChar    guibg=NONE guifg={{ colors.error_container.default.hex }}
hi Tag            guibg=NONE guifg={{ colors.primary_container.default.hex }}
hi Delimiter      guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi SpecialComment guibg=NONE guifg={{ colors.on_surface_variant.default.hex }} gui=italic
hi Debug          guibg=NONE guifg={{ colors.error.default.hex }}

hi Underlined     gui=underline guifg={{ colors.primary.default.hex }}
hi Ignore         guibg=NONE guifg={{ colors.outline_variant.default.hex }}
hi Todo           guibg=NONE guifg={{ colors.error.default.hex }} gui=bold,underline
" ==========================================================================
" Links
" ==========================================================================
hi! link Keyword Statement
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi! link SpecialChar Special
hi! link Tag Special
hi! link SpecialComment Comment
hi! link Debug Special
