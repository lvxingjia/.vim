" Vim syntax file
" Language:     CSS
" Maintainer:   Rinz
" Last Change:  2020 Nec 29

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'css'
elseif exists('b:current_syntax') && b:current_syntax == 'css'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn region  cssComment      start="/\*" end="\*/"
syn cluster cssSelector     contains=cssUnvSelector,cssTypSelector,cssClsSelector,cssIdSelector,cssGrpSelector,cssCombinator,cssPseudo
syn match   cssUnvSelector  "^\s*\%(\*\|\*\*\|\*ns\)\%(\s*\%({\|$\)\)\@="
syn match   cssTypSelector  "^\s*\%(\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssClsSelector  "^\s*\%(\%(\w\+\)\=\.\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssIdSelector   "^\s*\%(#\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssGrpSelector  "^\s*\%(\w\+\s*,\s*\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssCombinator   "^\s*\%(\w\+\s\+\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssCombinator   "^\s*\%(\w\+\s*>\s*\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssCombinator   "^\s*\%(\w\+\s*\~\s*\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssCombinator   "^\s*\%(\w\+\s*+\s*\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssCombinator   "^\s*\%(\w\+\s*||\s*\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssPseudo       "^\s*\%(\w\+\s*:\s*\w\+\)\%(\s*\%({\|$\)\)\@="
syn match   cssPseudo       "^\s*\%(\w\+\s*::\s*\w\+\)\%(\s*\%({\|$\)\)\@="


syn cluster cssTagContent   contains=cssAttr,cssValue,cssColorError,cssColor,cssNumber,cssOperator
syn region  cssTag          matchgroup=cssParen start="{" end="}" contains=@cssTagContent
syn match   cssAttr         "\%(\w\|-\)\+\s*:" contained
syn match   cssValue        "\%(\%(=\|:\)\s*\)\@<=.\+\%(;\)\@=" contained contains=cssNumber
syn match   cssColorError   "#\x\+" contained
syn match   cssColor        "#\x\{6\}" contained
syn match   cssColor        "\%(RGB\|rgb\)(\d\+,\d\+,\d\+)" contained
syn match   cssNumber       "\%(\%(=\|:\)\s*\)\@<=\d\+\%(\.\d\+\)\=\%(px\|em\|%\)" contained
syn match   cssOperator     "\%(=\|:\)" contained
" ========================================================================= "
hi def link cssComment      Comment
hi def link cssUnvSelector  Statement
hi def link cssTypSelector  Statement
hi def link cssClsSelector  Statement
hi def link cssIdSelector   Statement
hi def link cssGrpSelector  Statement
hi def link cssCombinator   Statement
hi def link cssPseudo       Statement

hi def link cssParen        Delimiter
hi def link cssAttr         Label
hi def link cssValue        String
hi def link cssColorError   Error
hi def link cssColor        Boolean
hi def link cssNumber       Number
hi def link cssOperator     Operator


let b:current_syntax = 'css'
if main_syntax == 'css'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
