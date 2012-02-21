" Vim color file
" Converted from Textmate theme Wandering using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Wandering"

hi Cursor ctermfg=234 ctermbg=71 cterm=NONE guifg=#212121 guibg=#65b042 gui=NONE
hi Visual ctermfg=NONE ctermbg=58 cterm=NONE guifg=NONE guibg=#354c2b gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#373737 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#373737 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#373737 gui=NONE
hi LineNr ctermfg=237 ctermbg=234 cterm=NONE guifg=#373737 guibg=#212121 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#616161 guibg=#616161 gui=NONE
hi MatchParen ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi StatusLine ctermfg=15 ctermbg=241 cterm=bold guifg=#ffffff guibg=#616161 gui=bold
hi StatusLineNC ctermfg=15 ctermbg=241 cterm=NONE guifg=#ffffff guibg=#616161 gui=NONE
hi Pmenu ctermfg=111 ctermbg=237 cterm=NONE guifg=#89bdff guibg=#373737 gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=58 cterm=NONE guifg=NONE guibg=#354c2b gui=NONE
hi IncSearch ctermfg=NONE ctermbg=58 cterm=NONE guifg=NONE guibg=#6a4525 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi Folded ctermfg=238 ctermbg=234 cterm=NONE guifg=#434343 guibg=#212121 gui=NONE
"This is a comment.
hi Normal ctermfg=15 ctermbg=234 cterm=NONE guifg=#ffffff guibg=#212121 gui=NONE
hi Boolean ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi Character ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi Comment ctermfg=240 ctermbg=236 cterm=NONE guifg=#707070 guibg=#333333 gui=italic
hi Conditional ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi Constant ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi Define ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi Function ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi Identifier ctermfg=113 ctermbg=NONE cterm=NONE guifg=#99cf50 guibg=NONE gui=NONE
hi Keyword ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi Label ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=236 cterm=NONE guifg=#484d53 guibg=#2c2c2c gui=NONE
hi Number ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi Operator ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi PreProc ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi Special ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guifg=#484d53 guibg=#373737 gui=NONE
hi Statement ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi StorageClass ctermfg=113 ctermbg=NONE cterm=NONE guifg=#99cf50 guibg=NONE gui=NONE
hi String ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE
hi Tag ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi Title ctermfg=15 ctermbg=NONE cterm=bold guifg=#ffffff guibg=NONE gui=bold
hi Todo ctermfg=238 ctermbg=236 cterm=inverse,bold guifg=#434343 guibg=#333333 gui=inverse,bold,italic
hi Type ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi rubyFunction ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi rubyConstant ctermfg=43 ctermbg=NONE cterm=NONE guifg=#09cea0 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi rubyInclude ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyEscape ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi rubyControl ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi rubyOperator ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi rubyException ctermfg=191 ctermbg=NONE cterm=NONE guifg=#ccff66 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=43 ctermbg=NONE cterm=NONE guifg=#09cea0 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=238 ctermbg=236 cterm=NONE guifg=#434343 guibg=#333333 gui=italic
hi erubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi htmlTag ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlEndTag ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlTagName ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlArg ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=113 ctermbg=NONE cterm=NONE guifg=#99cf50 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi yamlAnchor ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi yamlAlias ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8e2d guibg=NONE gui=NONE
hi cssFunctionName ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi cssColor ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi cssClassName ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi cssValueLength ctermfg=160 ctermbg=NONE cterm=NONE guifg=#e12a05 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=17 ctermbg=NONE cterm=bold guifg=#2a173d guibg=NONE gui=bold
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" TODO: Fix this
hi cssImportant ctermfg=WHITE ctermbg=160 cterm=BOLD guifg=#ffffff guibg=#89bdff gui=bold




"Special for SCSS
hi scssVariable               guifg=#9caf78     guibg=NONE        gui=BOLD
"hi scssVariable               guifg=#9caf78     guibg=NONE        gui=BOLD      ctermfg=brown       ctermbg=NONE        cterm=BOLD

hi link scssColor             cssValueNumber
hi link scssAmpersand         scssVariable
hi link scssMixin             cssInclude
hi link scssInclude           cssInclude
hi link scssExtend            cssInclude
hi link scssMixinName         cssFunctionName
hi link scssClass             cssClassName
hi link scssID                cssIdentifier
hi link scssIdChar            scssColor


" Special for Javascript
hi javaScriptType             guifg=#ff9c14     guibg=NONE        gui=NONE
hi javaScriptBlock            guifg=#ffffff     guibg=NONE        gui=NONE
hi javaScriptParen            guifg=#ffffff     guibg=NONE        gui=NONE
hi javaScriptFunction         guifg=#9add51     guibg=NONE        gui=NONE
hi javaScriptFuncName         guifg=#96c8ff     guibg=NONE        gui=NONE
hi javaScriptDocTags          guifg=#dddddd     guibg=#424241     gui=BOLD
hi javaScriptDocParam         guifg=#c8ff65     guibg=#424241     gui=NONE

"hi javaScriptType             guifg=#ff9c14     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
"hi javaScriptBlock            guifg=#ffffff     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE
"hi javaScriptParen            guifg=#ffffff     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE
"hi javaScriptFunction         guifg=#9add51     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
"hi javaScriptFuncName         guifg=#96c8ff     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
"hi javaScriptDocTags          guifg=#dddddd     guibg=#424241     gui=BOLD      ctermfg=gray          ctermbg=NONE        cterm=BOLD
"hi javaScriptDocParam         guifg=#c8ff65     guibg=#424241     gui=NONE      ctermfg=cyan

hi link javaScriptFuncBlock   Entity
hi link javaScriptNumber      Number


" Special for Python
"hi  link pythonEscape         Keyword


" Special for CSharp
hi  link csXmlTag             Keyword


" Special for PHP
hi phpIdentifier              guifg=#ff9c14     guibg=NONE        gui=NONE
hi phpStorageClass            guifg=#9add51     guibg=NONE        gui=NONE
"hi phpIdentifier              guifg=#ff9c14     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
"hi phpStorageClass            guifg=#9add51     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE

hi link phpOperator           Keyword
hi link phpVarSelector        phpIdentifier
