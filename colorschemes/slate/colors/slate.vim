" Vim color file
" Converted from Textmate theme Slate using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Slate"

hi Cursor ctermfg=NONE ctermbg=109 cterm=NONE guifg=NONE guibg=#8ba7a7 gui=NONE
hi Visual ctermfg=NONE ctermbg=66 cterm=NONE guifg=NONE guibg=#708c99 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#314b5a gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#314b5a gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#314b5a gui=NONE
hi LineNr ctermfg=103 ctermbg=59 cterm=NONE guifg=#8a98a1 guibg=#314b5a gui=NONE
hi VertSplit ctermfg=60 ctermbg=60 cterm=NONE guifg=#5b707c guibg=#5b707c gui=NONE
hi MatchParen ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi StatusLine ctermfg=231 ctermbg=60 cterm=bold guifg=#f8f8f8 guibg=#5b707c gui=bold
hi StatusLineNC ctermfg=231 ctermbg=60 cterm=NONE guifg=#f8f8f8 guibg=#5b707c gui=NONE
hi Pmenu ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=66 cterm=NONE guifg=NONE guibg=#708c99 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#65584a gui=NONE
hi Search ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#65584a gui=NONE
hi Directory ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi Folded ctermfg=32 ctermbg=NONE cterm=NONE guifg=#1e9ae0 guibg=#1b3849 gui=NONE
"hi Folded ctermfg=32 ctermbg=23 cterm=NONE guifg=#1e9ae0 guibg=#273449 gui=NONE

"hi Normal ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f8 guibg=#273449 gui=NONE
hi Normal ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=#1b3849 gui=NONE
hi Boolean ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi Character ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi Comment ctermfg=32 ctermbg=NONE cterm=NONE guifg=#1e9ae0 guibg=NONE gui=italic
hi Conditional ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi Constant ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi Define ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#a72d1d gui=NONE
hi WarningMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#a72d1d gui=NONE
hi Float ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi Function ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi Keyword ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi Label ctermfg=77 ctermbg=NONE cterm=NONE guifg=#55e439 guibg=NONE gui=NONE
hi NonText ctermfg=60 ctermbg=23 cterm=NONE guifg=#546a77 guibg=#264252 gui=NONE
hi Number ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi Operator ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi PreProc ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=NONE gui=NONE
hi SpecialKey ctermfg=60 ctermbg=59 cterm=NONE guifg=#546a77 guibg=#314b5a gui=NONE
hi Statement ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi StorageClass ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi String ctermfg=77 ctermbg=NONE cterm=NONE guifg=#55e439 guibg=NONE gui=NONE
hi Tag ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo ctermfg=32 ctermbg=NONE cterm=inverse,bold guifg=#1e9ae0 guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi rubyFunction ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi rubyConstant ctermfg=157 ctermbg=NONE cterm=NONE guifg=#9df39f guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=77 ctermbg=NONE cterm=NONE guifg=#55e439 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyInclude ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRegexp ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyEscape ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi rubyControl ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyOperator ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi rubyException ctermfg=214 ctermbg=NONE cterm=NONE guifg=#ffaa00 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=157 ctermbg=NONE cterm=NONE guifg=#9df39f guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=32 ctermbg=NONE cterm=NONE guifg=#1e9ae0 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi htmlTag ctermfg=159 ctermbg=NONE cterm=NONE guifg=#9effff guibg=NONE gui=NONE
hi htmlEndTag ctermfg=159 ctermbg=NONE cterm=NONE guifg=#9effff guibg=NONE gui=NONE
hi htmlTagName ctermfg=159 ctermbg=NONE cterm=NONE guifg=#9effff guibg=NONE gui=NONE
hi htmlArg ctermfg=159 ctermbg=NONE cterm=NONE guifg=#9effff guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlAlias ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=77 ctermbg=NONE cterm=NONE guifg=#55e439 guibg=NONE gui=NONE
hi cssURL ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fb9a4b guibg=NONE gui=NONE
hi cssFunctionName ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb454 guibg=NONE gui=NONE
hi cssColor ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi cssClassName ctermfg=220 ctermbg=NONE cterm=NONE guifg=#efe900 guibg=NONE gui=NONE
hi cssValueLength ctermfg=204 ctermbg=NONE cterm=NONE guifg=#ff3a83 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=174 ctermbg=NONE cterm=NONE guifg=#eb939a guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
