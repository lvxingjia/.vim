" Vim syntax file
" Language:     Pseudocode
" Author:       Rinz
" Create Time:  2021 Feb 14

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'pseudocode'
elseif exists('b:current_syntax') && b:current_syntax == 'pseudocode'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn match   pcIdentifier    "\w\+"
syn match   pcOperator      "=\|+\|-\|\*\|\/\|%\|>\|<\|:\|?"
syn match   pcOperator      "\\\|\~\|\^\|\$\|#\|@\|&\|!"
syn keyword pcOperator      in of to by is not and or all any
syn match   pcParens        "[()\[\]{}]"
syn match   pcParens        "[()]"
syn match   pcBracks        "[\[\]]"
syn match   pcBraces        "[{}]"
syn region  pcComment       start="//\|#\|;" end="$" keepend contains=pcVimCmd
syn region  pcComment       start="/\*" end="\*/" keepend contains=pcVimCmd
syn match   pcVimCmd        "^\%(//\|#\).*\%(ex\|vi\|vim\)\s*:.*$" contained


syn keyword pcBoolean       true false none null nil undefined
syn match   pcNumber        "\%(+\|-\)\=\d\+\%(.\d\+\)\="
syn region  pcString        start=+"+ end=+"+
syn region  pcString        start=+'+ end=+'+

syn keyword pcType          int short long signed unsigned bool float double void
syn keyword pcADT           array vector scalar list dict hash object deque suque map
syn keyword pcStorageClass  extern register static
syn keyword pcSpecifier     const restrict volatile
syn keyword pcModifier      public private protected
syn keyword pcDefine        define set let var undef unset unlet unvar
syn keyword pcStatement     return yield goto break continue default
syn keyword pcStatement     begin end endif endcond endcond endcase endswitch
syn keyword pcStatement     endwhen endunless endfor enddo endwhile endloop
syn keyword pcConditonal    if cond case then else switch when unless
syn keyword pcRepeat        for do while loop
syn keyword pcStructure     func proc meth struct class type
syn keyword pcStructure     endfunc endproc endmeth endstruct endclass endtype

syn match   pcLabel         "^\<\w\+\>\s*:\s*$"
syn match   pcLabel         "\%(goto\s\+\)\@<=\<\w\+\>"
syn match   pcBlock         "^<.*>\s*\%(\%(\|=\|+=\|==\)\s*$\)\@="
syn match   pcBlockTitle    "^<\s*\S\+\%(.*>\s*\%(\|=\|+=\|==\)\s*$\)\@="
" ========================================================================= "
hi def link pcIdentifier    Identifier
hi def link pcOperator      Operator
hi def link pcParens        Structure
hi def link pcBracks        Variable
hi def link pcBraces        Function
hi def link pcComment       Comment
hi def link pcVimCmd        SpecialComment
hi def link pcBoolean       Boolean
hi def link pcNumber        Number
hi def link pcString        String
hi def link pcType          Type
hi def link pcADT           Type
hi def link pcSpecifier     Specifier
hi def link pcDefine        Statement
hi def link pcStatement     Statement
hi def link pcConditonal    Conditional
hi def link pcRepeat        Repeat
hi def link pcStructure     Tag
hi def link pclabel         Label
hi def link pcBlock         OrangeItalic
hi def link pcBlockTitle    OrangeBoldItalic

" ========================================================================= "
let b:current_syntax = 'pseudocode'
if main_syntax == 'pseudocode'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
