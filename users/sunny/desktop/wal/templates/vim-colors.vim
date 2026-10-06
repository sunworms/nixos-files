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
  let g:terminal_color_0  = "{color0}"
  let g:terminal_color_1  = "{color1}"
  let g:terminal_color_2  = "{color2}"
  let g:terminal_color_3  = "{color3}"
  let g:terminal_color_4  = "{color4}"
  let g:terminal_color_5  = "{color5}"
  let g:terminal_color_6  = "{color6}"
  let g:terminal_color_7  = "{color7}"
  let g:terminal_color_8  = "{color8}"
  let g:terminal_color_9  = "{color9}"
  let g:terminal_color_10 = "{color10}"
  let g:terminal_color_11 = "{color11}"
  let g:terminal_color_12 = "{color12}"
  let g:terminal_color_13 = "{color13}"
  let g:terminal_color_14 = "{color14}"
  let g:terminal_color_15 = "{color15}"
endif

" ==========================================================================
" Core editor surface
" ==========================================================================
hi Normal        guibg=NONE guifg={foreground}
hi NormalNC      guibg=NONE guifg={foreground}
hi EndOfBuffer   guibg=NONE guifg={color8}
hi NonText       guibg=NONE guifg={color8}
hi SpecialKey    guibg=NONE guifg={color8}
hi Whitespace    guibg=NONE guifg={color8}
hi Conceal       guibg=NONE guifg={color15}
hi Cursor        guibg={color4} guifg={foreground}
hi lCursor       guibg={color4} guifg={foreground}
hi CursorIM      guibg={color4} guifg={foreground}

hi CursorLine    guibg={background} guifg=NONE
hi CursorColumn  guibg={background} guifg=NONE
hi ColorColumn   guibg={background} guifg=NONE
hi MatchParen    guibg={color15} guifg={color0} gui=bold

hi LineNr        guibg=NONE guifg={foreground}
hi CursorLineNr  guibg={color0} guifg={foreground} gui=bold
hi SignColumn    guibg=NONE guifg={foreground}
hi FoldColumn    guibg=NONE guifg={foreground}
hi CursorLineSign guibg={color0} guifg={foreground}
hi CursorLineFold guibg={color0} guifg={foreground}
hi Folded        guibg={background} guifg={color15} gui=italic

hi Visual        guibg={color15} guifg={color0}
hi VisualNOS     guibg={color15} guifg={color0}
hi Selection     guibg={color15} guifg={color0}

hi Title         guibg=NONE guifg={color4} gui=bold
hi Directory     guibg=NONE guifg={color4}

" ==========================================================================
" Search
" ==========================================================================
hi Search        guibg={color15} guifg={color0}
hi IncSearch     guibg={color15} guifg={color0} gui=bold
hi CurSearch     guibg={color15} guifg={color0} gui=bold
hi QuickFixLine  guibg={color0} guifg={foreground} gui=bold

" ==========================================================================
" Status line, tabs, windows
" ==========================================================================
hi StatusLine    guibg=NONE guifg={foreground}
hi StatusLineNC  guibg=NONE guifg={foreground}
hi VertSplit     guibg=NONE guifg={color8}
hi TabLine       guibg={color0} guifg={foreground}
hi TabLineSel    guibg={color15} guifg={color0} gui=bold
hi TabLineFill   guibg={color0} guifg={foreground}
hi WildMenu      guibg={color15} guifg={color0} gui=bold

" mini.statusline (used by require("mini.statusline").setup())
hi MiniStatuslineModeNormal  guibg=NONE guifg={foreground} gui=bold
hi MiniStatuslineModeInsert  guibg=NONE guifg={foreground} gui=bold
hi MiniStatuslineModeVisual  guibg=NONE guifg={foreground} gui=bold
hi MiniStatuslineModeReplace guibg=NONE guifg={foreground} gui=bold
hi MiniStatuslineModeCommand guibg=NONE guifg={foreground} gui=bold
hi MiniStatuslineModeOther   guibg=NONE guifg={foreground} gui=bold
hi MiniStatuslineFilename    guibg=NONE guifg={foreground}
hi MiniStatuslineFileinfo    guibg=NONE guifg={foreground}
hi MiniStatuslineDevinfo     guibg=NONE guifg={foreground}
hi MiniStatuslineInactive    guibg=NONE guifg={foreground}

" ==========================================================================
" Popup / completion menu
" ==========================================================================
hi Pmenu         guibg={color0} guifg={foreground}
hi PmenuSel      guibg={color15} guifg={color0} gui=bold
hi PmenuKind     guibg={color0} guifg={color10}
hi PmenuKindSel  guibg={color15} guifg={color0} gui=bold
hi PmenuExtra    guibg={color0} guifg={foreground}
hi PmenuExtraSel guibg={color15} guifg={color0}
hi PmenuMatch    guibg={color0} guifg={color12} gui=bold
hi PmenuMatchSel guibg={color15} guifg={color0} gui=bold
hi PmenuSbar     guibg={color0}
hi PmenuThumb    guibg={color7}

" ==========================================================================
" Diff
" ==========================================================================
hi DiffAdd       guibg={color11} guifg={foreground}
hi DiffChange    guibg={color10} guifg={foreground}
hi DiffDelete    guibg={color9} guifg={foreground}
hi DiffText      guibg={color12} guifg={foreground} gui=bold
hi link Added    DiffAdd
hi link Changed  DiffChange
hi link Removed  DiffDelete

" ==========================================================================
" Spelling
" ==========================================================================
hi SpellBad      guisp={color1} gui=undercurl guifg=NONE guibg=NONE
hi SpellCap      guisp={color2} gui=undercurl guifg=NONE guibg=NONE
hi SpellLocal    guisp={color3} gui=undercurl guifg=NONE guibg=NONE
hi SpellRare     guisp={color4} gui=undercurl guifg=NONE guibg=NONE

" ==========================================================================
" Messages / prompts
" ==========================================================================
hi Error         guibg={color0} guifg={color9}
hi ErrorMsg      guibg={color0} guifg={color9}
hi WarningMsg    guibg={color0} guifg={color11}
hi ModeMsg       guibg={color0} guifg={foreground} gui=bold
hi MoreMsg       guibg={color0} guifg={foreground}
hi Question      guibg={color0} guifg={foreground}

" ==========================================================================
" :terminal buffers
" ==========================================================================
hi Terminal      guibg={color0} guifg={color5}

" ==========================================================================
" Legacy Syntax Highlighting
" ==========================================================================
hi Comment        guibg=NONE guifg={color15} gui=italic

hi Constant       guibg=NONE guifg={color2}
hi String         guibg=NONE guifg={color11}
hi Character      guibg=NONE guifg={color5}
hi Number         guibg=NONE guifg={color5}
hi Boolean        guibg=NONE guifg={color2} gui=bold
hi Float          guibg=NONE guifg={color5}

hi Identifier     guibg=NONE guifg={color15}
hi Function       guibg=NONE guifg={color4}

hi Statement      guibg=NONE guifg={color4} gui=bold
hi Conditional    guibg=NONE guifg={color2} gui=bold
hi Repeat         guibg=NONE guifg={color2} gui=bold
hi Label          guibg=NONE guifg={color3}
hi Operator       guibg=NONE guifg={color15}
hi Keyword        guibg=NONE guifg={color4} gui=bold
hi Exception      guibg=NONE guifg={color1} gui=bold

hi PreProc        guibg=NONE guifg={color4}
hi Include        guibg=NONE guifg={color4}
hi Define         guibg=NONE guifg={color4}
hi Macro          guibg=NONE guifg={color2}
hi PreCondit      guibg=NONE guifg={color4}

hi Type           guibg=NONE guifg={color10}
hi StorageClass   guibg=NONE guifg={color4}
hi Structure      guibg=NONE guifg={color3}
hi Typedef        guibg=NONE guifg={color10}

hi Special        guibg=NONE guifg={color5}
hi SpecialChar    guibg=NONE guifg={color2}
hi Tag            guibg=NONE guifg={color4}
hi Delimiter      guibg=NONE guifg={color15}
hi SpecialComment guibg=NONE guifg={color15} gui=italic
hi Debug          guibg=NONE guifg={color1}

hi Underlined     gui=underline guifg={color4}
hi Ignore         guibg=NONE guifg={color8}
hi Todo           guibg=NONE guifg={color1} gui=bold,underline

" ==========================================================================
" Neovim Specific Section
" ==========================================================================
if has('nvim')

" --------------------------------------------------------------------------
" Floating windows & UI separators
" --------------------------------------------------------------------------
hi NormalFloat   guibg={color0} guifg={foreground}
hi FloatBorder   guibg={color0} guifg={color7}
hi FloatTitle    guibg={color0} guifg={foreground} gui=bold
hi WinSeparator  guibg=NONE guifg={color8}
hi WinBar        guibg=NONE guifg={color15}
hi WinBarNC      guibg=NONE guifg={color15}

" --------------------------------------------------------------------------
" Native diagnostics
" --------------------------------------------------------------------------
hi DiagnosticError guibg=NONE guifg={color1}
hi DiagnosticWarn  guibg=NONE guifg={color2}
hi DiagnosticInfo  guibg=NONE guifg={color3}
hi DiagnosticHint  guibg=NONE guifg={color15} gui=italic
hi DiagnosticOk    guibg=NONE guifg={color3}

hi DiagnosticVirtualTextError guibg={color0} guifg={color9}
hi DiagnosticVirtualTextWarn  guibg={color0} guifg={color11}
hi DiagnosticVirtualTextInfo  guibg={color0} guifg={color12}
hi DiagnosticVirtualTextHint  guibg={color0} guifg={color14}
hi DiagnosticVirtualTextOk    guibg={color0} guifg={color10}

hi DiagnosticUnderlineError guisp={color1}     gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineWarn  guisp={color2}  gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineInfo  guisp={color3} gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineHint  guisp={color15}   gui=undercurl guifg=NONE guibg=NONE
hi DiagnosticUnderlineOk    guisp={color3} gui=undercurl guifg=NONE guibg=NONE

hi DiagnosticFloatingError guibg={color0} guifg={color9}
hi DiagnosticFloatingWarn  guibg={color0} guifg={color11}
hi DiagnosticFloatingInfo  guibg={color0} guifg={color12}
hi DiagnosticFloatingHint  guibg={color0} guifg={color14}
hi DiagnosticFloatingOk    guibg={color0} guifg={color10}

hi DiagnosticSignError guibg=NONE guifg={color9}
hi DiagnosticSignWarn  guibg=NONE guifg={color11}
hi DiagnosticSignInfo  guibg=NONE guifg={color12}
hi DiagnosticSignHint  guibg=NONE guifg={color14}
hi DiagnosticSignOk    guibg=NONE guifg={color10}

hi DiagnosticDeprecated gui=strikethrough guifg={color7} guibg=NONE
hi DiagnosticUnnecessary guifg={color7} guibg=NONE

" LSP document/reference highlighting
" These are used when hovering/holding on a symbol and should not depend on
" Visual/Pmenu colors (which may be very light with pywal).
hi LspReferenceText   guibg={color0} guifg={foreground}
hi LspReferenceRead   guibg={color0} guifg={foreground}
hi LspReferenceWrite  guibg={color0} guifg={foreground}
hi LspReferenceTarget guibg={color0} guifg={foreground}
hi LspInlayHint       guibg={color0} guifg={foreground}
hi LspCodeLens        guibg=NONE guifg={color7}
hi LspCodeLensSeparator guibg=NONE guifg={color8}

" --------------------------------------------------------------------------
" Treesitter highlight groups
" --------------------------------------------------------------------------

" Variables & Identifiers
hi @variable                    guibg=NONE guifg={foreground}
hi @variable.builtin            guibg=NONE guifg={color2} gui=italic
hi @variable.parameter          guibg=NONE guifg={color3}
hi @variable.parameter.builtin  guibg=NONE guifg={color3} gui=italic
hi @variable.member             guibg=NONE guifg={color5}

" Constants
hi @constant         guibg=NONE guifg={color2}
hi @constant.builtin guibg=NONE guifg={color2} gui=bold
hi @constant.macro   guibg=NONE guifg={color2}

" Strings, characters, numbers
hi @string                guibg=NONE guifg={color11}
hi @string.documentation  guibg=NONE guifg={color11} gui=italic
hi @string.regexp         guibg=NONE guifg={color2}
hi @string.escape         guibg=NONE guifg={color2} gui=bold
hi @string.special        guibg=NONE guifg={color5}
hi @string.special.symbol guibg=NONE guifg={color5}
hi @string.special.url    guibg=NONE guifg={color4} gui=underline
hi @character             guibg=NONE guifg={color5}
hi @character.special     guibg=NONE guifg={color2}
hi @number                guibg=NONE guifg={color5}
hi @number.float          guibg=NONE guifg={color5}
hi @boolean               guibg=NONE guifg={color2} gui=bold
hi @float                 guibg=NONE guifg={color5}

" Functions
hi @function             guibg=NONE guifg={color4}
hi @function.builtin     guibg=NONE guifg={color4} gui=italic
hi @function.call        guibg=NONE guifg={color4}
hi @function.macro       guibg=NONE guifg={color2}
hi @function.method      guibg=NONE guifg={color4}
hi @function.method.call guibg=NONE guifg={color4}
hi @constructor          guibg=NONE guifg={color10} gui=bold

" Keywords / control flow
hi @keyword             guibg=NONE guifg={color4} gui=bold
hi @keyword.function    guibg=NONE guifg={color4} gui=bold
hi @keyword.operator    guibg=NONE guifg={color15}
hi @keyword.return      guibg=NONE guifg={color4} gui=bold
hi @keyword.import      guibg=NONE guifg={color4} gui=bold
hi @keyword.repeat      guibg=NONE guifg={color2} gui=bold
hi @keyword.conditional guibg=NONE guifg={color2} gui=bold
hi @keyword.exception   guibg=NONE guifg={color1} gui=bold
hi @keyword.directive   guibg=NONE guifg={color4}
hi @keyword.modifier    guibg=NONE guifg={color4}
hi @keyword.coroutine   guibg=NONE guifg={color2} gui=bold

" Types & Attributes
hi @type            guibg=NONE guifg={color10}
hi @type.builtin    guibg=NONE guifg={color10} gui=italic
hi @type.definition guibg=NONE guifg={color10} gui=bold
hi @storageclass    guibg=NONE guifg={color4}
hi @attribute       guibg=NONE guifg={color4}
hi @attribute.builtin guibg=NONE guifg={color4} gui=italic
hi @property        guibg=NONE guifg={color5}
hi @field           guibg=NONE guifg={color5}
hi @namespace       guibg=NONE guifg={color11}
hi @module          guibg=NONE guifg={color11}

" Punctuation
hi @punctuation.delimiter guibg=NONE guifg={color15}
hi @punctuation.bracket   guibg=NONE guifg={color15}
hi @punctuation.special   guibg=NONE guifg={color5}

" Comments
hi @comment               guibg=NONE guifg={color15} gui=italic
hi @comment.documentation guibg=NONE guifg={color15} gui=italic
hi @comment.error         guibg=NONE guifg={color1} gui=bold
hi @comment.warning       guibg=NONE guifg={color2} gui=bold
hi @comment.todo          guibg=NONE guifg={color1} gui=bold,underline
hi @comment.note          guibg=NONE guifg={color3} gui=bold

" Markup / Prose
hi @markup.strong        gui=bold
hi @markup.italic        gui=italic
hi @markup.strikethrough gui=strikethrough
hi @markup.underline     gui=underline
hi @markup.heading       guibg=NONE guifg={color4} gui=bold
hi @markup.heading.1     guibg=NONE guifg={color4} gui=bold
hi @markup.heading.2     guibg=NONE guifg={color3} gui=bold
hi @markup.heading.3     guibg=NONE guifg={color2} gui=bold
hi @markup.heading.4     guibg=NONE guifg={color4} gui=bold
hi @markup.heading.5     guibg=NONE guifg={color6} gui=bold
hi @markup.heading.6     guibg=NONE guifg={color5} gui=bold
hi @markup.quote         guibg=NONE guifg={color15} gui=italic
hi @markup.math          guibg=NONE guifg={color2}
hi @markup.link          guibg=NONE guifg={color4} gui=underline
hi @markup.link.label    guibg=NONE guifg={color3}
hi @markup.link.url      guibg=NONE guifg={color4} gui=underline
hi @markup.raw           guibg={background} guifg={foreground}
hi @markup.raw.block     guibg={background} guifg={foreground}
hi @markup.list          guibg=NONE guifg={color3}
hi @markup.list.checked  guibg=NONE guifg={color3}
hi @markup.list.unchecked guibg=NONE guifg={color15}

" Tags (HTML / JSX / XML)
hi @tag           guibg=NONE guifg={color4}
hi @tag.attribute guibg=NONE guifg={color3} gui=italic
hi @tag.delimiter guibg=NONE guifg={color15}

" Diff captures
hi @diff.plus  guibg=NONE guifg={color3}
hi @diff.minus guibg=NONE guifg={color1}
hi @diff.delta guibg=NONE guifg={color2}

" --------------------------------------------------------------------------
" Native Neovim LSP Semantic Tokens (@lsp.type.*)
" --------------------------------------------------------------------------
hi @lsp.type.class         guibg=NONE guifg={color10}
hi @lsp.type.comment       guibg=NONE guifg={color15} gui=italic
hi @lsp.type.enum          guibg=NONE guifg={color10}
hi @lsp.type.enumMember    guibg=NONE guifg={color2}
hi @lsp.type.function      guibg=NONE guifg={color4}
hi @lsp.type.interface     guibg=NONE guifg={color2} gui=italic
hi @lsp.type.keyword       guibg=NONE guifg={color4} gui=bold
hi @lsp.type.macro         guibg=NONE guifg={color2}
hi @lsp.type.method        guibg=NONE guifg={color4}
hi @lsp.type.namespace     guibg=NONE guifg={color11}
hi @lsp.type.number        guibg=NONE guifg={color5}
hi @lsp.type.operator      guibg=NONE guifg={color15}
hi @lsp.type.parameter     guibg=NONE guifg={color3}
hi @lsp.type.property      guibg=NONE guifg={color5}
hi @lsp.type.struct        guibg=NONE guifg={color10}
hi @lsp.type.type          guibg=NONE guifg={color10}
hi @lsp.type.variable      guibg=NONE guifg={foreground}

" --------------------------------------------------------------------------
" Plugin Support
" --------------------------------------------------------------------------

" GitSigns
hi GitSignsAdd    guibg=NONE guifg={color3}
hi GitSignsChange guibg=NONE guifg={color2}
hi GitSignsDelete guibg=NONE guifg={color1}

" Telescope / FZF-Lua / Snacks Picker
hi TelescopeNormal          guibg={color8} guifg={foreground}
hi TelescopeBorder          guibg={color8} guifg={color15}
hi TelescopePromptNormal    guibg={color8} guifg={foreground}
hi TelescopePromptBorder    guibg={color8} guifg={color8}
hi TelescopePromptTitle     guibg={color4} guifg={foreground} gui=bold
hi TelescopeSelection       guibg={color8} guifg={foreground}
hi TelescopeSelectionCaret  guibg={color8} guifg={color4}

" Completion (nvim-cmp & blink.cmp)
hi CmpItemAbbrDeprecated gui=strikethrough guifg={color15}
hi CmpItemAbbrMatch      guifg={color4} gui=bold
hi CmpItemAbbrMatchFuzzy guifg={color4} gui=bold
hi CmpItemKind           guifg={color2}
hi CmpItemMenu           guifg={color15}

hi BlinkCmpMenu              guibg={color0} guifg={foreground}
hi BlinkCmpMenuBorder        guibg={color0} guifg={color7}
hi BlinkCmpMenuSelection     guibg={color15} guifg={color0} gui=bold
hi BlinkCmpScrollBarThumb    guibg={color7} guifg={color0}
hi BlinkCmpScrollBarGutter   guibg={color0}
hi BlinkCmpLabel              guibg={color0} guifg={foreground}
hi BlinkCmpLabelDeprecated   guibg={color0} guifg={foreground} gui=strikethrough
hi BlinkCmpLabelMatch        guibg={color0} guifg={color12} gui=bold
hi BlinkCmpLabelDetail       guibg={color0} guifg={foreground}
hi BlinkCmpLabelDescription  guibg={color0} guifg={foreground}
hi BlinkCmpKind               guibg={color0} guifg={color10}
hi BlinkCmpSource             guibg={color0} guifg={foreground}
hi BlinkCmpGhostText          guibg=NONE guifg={color7}
hi BlinkCmpDoc                guibg={color0} guifg={foreground}
hi BlinkCmpDocBorder          guibg={color0} guifg={color7}
hi BlinkCmpDocSeparator      guibg={color0} guifg={color8}
hi BlinkCmpDocCursorLine     guibg={color15} guifg={color0}
hi BlinkCmpSignatureHelp     guibg={color0} guifg={foreground}
hi BlinkCmpSignatureHelpBorder guibg={color0} guifg={color7}
hi BlinkCmpSignatureHelpActiveParameter guibg={color15} guifg={color0} gui=bold

hi BlinkCmpItemAbbrDeprecated gui=strikethrough guifg={foreground}
hi BlinkCmpItemAbbrMatch      guifg={color12} gui=bold
hi BlinkCmpItemKind           guifg={color10}

" Indent Blankline (ibl)
hi IblIndent guifg={color8} gui=nocombine
hi IblScope  guifg={color15} gui=nocombine

endif
