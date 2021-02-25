" Vim syntax file
" Language:     Scheme
" Author:       Rinz
" Create Time:  2021 Jan 26

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'scheme'
elseif exists('b:current_syntax') && b:current_syntax == 'scheme'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn match   ssBoolean       "\%(#t\%(rue\)\=\>\)\|\%(#f\%(alse\)\=\>\)"
syn cluster ssNumber        contains=scmInteger,scmRational,scmRational,scmComplex
syn match   ssInteger       "\<\%(#b[01]\+\|#o\o\+\|#x\x\+\|\%(#d\)\=\%(+\|-\)\=\d\+\)\%(+\|-\|\.\|\/\)\@!"
syn match   ssRational      "\<\%(+\|-\)\=\d\+\/\d\+"
syn match   ssReal          "\<\%(+\|-\)\=\%(\d\+\)\=\.\d\+"
syn match   ssComplex       "\<\%(\d\|-\)\@<=i\>"
syn match   ssCharacter     "#\\."
syn match   ssCharacter     "#\\\%(\s\|space\|tab\|newline\|linefeed\)"
syn match   ssEscape        "\\\%(a\|b\|t\|n\|v\|f\|r\|\"\|\\\|\\x\x\+;\)" contained
syn region  ssString        start=+\(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+ contains=scmEscape
syn region  ssSymbol        start=+\(\\\)\@<!|+ skip=+\\[\\|]+ end=+|+
syn match   ssVector        "#\%(vu8\)\=("

syn match   ssParens        "[()\[\]]"
syn match   ssBegin         "\%([(\[]\)\@<=begin\%(\s\)\@="
syn match   ssArgsParens    "\%(\<\%(define\|lambda\)\s\+\)\@<=[(\[]"
syn match   ssArgsParens    "\%(\<\%(define\|lambda\)\s\+([^)]*\)\@<=)"
syn match   ssArgsParens    "\%(\<\%(define\|lambda\)\s\+\[[^\]]*\)\@<=]"
syn match   ssArgsParens    "\%(\<\%(let\%(rec\)\=\%(\*\)\=\)\s\+\)\@<=[(\[]"
syn match   ssArgsParens    "\%(\<\%(let\%(rec\)\=\%(\*\)\=\)\s\+(.*\)\@<=)$"
syn match   ssArgsParens    "\%(\<\%(let\%(rec\)\=\%(\*\)\=\)\s\+\[.*\)\@<=\]$"
syn match   ssCondParens    "\%(\<\%(if\|when\|unless\)\s\+\)\@<=[(\[]"
syn match   ssCondParens    "\%(\<\%(if\|when\|unless\)\s\+[(\[].*\)\@<=[)\]]$"

syn match   ssVariable      "\%(\<define\s\+[(\[]\s*\)\@<=\S\+\%(\s\)\@="
syn match   ssVariable      "\%(\<define\s\+\)\@<=\S\+\%(\s\+[(\[]\s*lambda\)\@="
syn match   ssParameter     "\%(\<define\s\+[(\[]\s*\S\+\s\+\)\@<=[^()\[\]]\+"
syn match   ssParameter     "\%(\<lambda\s\+[(\[]\s*\)\@<=[^()\[\]]\+"
syn match   ssParameter     "\%(\<let\%(rec\)\=\*\=\s\+[(\[]\s*.*[(\[]\)\@<=[^()\[\]]\+\%(\s\)\@="

syn match   ssQuote         "\%(#\)\=\%('\|`\|,@\|,\)\%((\)\@="
syn match   ssQuote         "\<\%(quote\|unquote\|quasiquote\|unquote-splicing\)\>"
syn match   ssDelimiter     "\%(\s\)\@<=\.\%(\s\)\@="
syn match   ssComment       ";.*$"
syn region  ssComment       start=+#|+ end=+|#+

syn match   ssDefine        "\<\%(define\|lambda\|define-record-type\|define-values\|set!\)\>"
syn match   ssLet           "\<\%(let\%(rec\)\=\%(\*\)\=\|let\%(\*\)\=-values\|fluid-let\)\>"

syn match   ssStatement     "=>\%(\s\)\@="
syn match   ssStatement     "\<\%(delay\|delay-force\|guard\|parameterize\)\>"
syn match   ssConditional   "\<\%(if\|cond\|else\|case\|case-lambda\|when\|unless\)\%(-\|_\)\@!\>"
syn match   ssRepeat        "\<do\%(-\|_\)\@!\>"

syn match   ssLibrary       "\<\%(define-library\|export\|include\|include-ci\|include-library-declarations\|library\|cond-expand\)\>"
syn match   ssSyntax        "\<\%(\%(define\|let\%(rec\)\=\|identifier\)-syntax\|syntax-\%(rules\|case\)\)\>"

syn match   ssOperator      "\<\%(and\|or\)\>"
syn match   ssFunction      "\%((\|\s\)\@<=\%(\*\|+\|-\|\/\|<\|<=\|=\|>\|>=\)\%(\s\)\@="
syn match   ssFunction      "\<\%(abs\|acos\|acos\|angle\|append\|apply\|asin\|assoc\|assq\|assv\)\>"
syn match   ssFunction      "\<\%(atan\|binary-port?\|boolean=?\|boolean?\|bytevector\|bytevector-append\|bytevector-append\|bytevector-copy\|bytevector-copy!\|bytevector-length\)\>"
syn match   ssFunction      "\<\%(bytevector-u8-ref\|bytevector-u8-set!\|bytevector?\|caaaar\|caaadr\|caaar\|caadar\|caaddr\|caadr\|caar\)\>"
syn match   ssFunction      "\<\%(cadaar\|cadadr\|cadar\|caddar\|cadddr\|caddr\|cadr\|call-with-current-continuation\|call-with-input-file\|call-with-output-file\)\>"
syn match   ssFunction      "\<\%(call-with-port\|call-with-values\|call/cc\|car\|cdaaar\|cdaadr\|cdaar\|cdadar\|cdaddr\|cdadr\)\>"
syn match   ssFunction      "\<\%(cdar\|cddaar\|cddadr\|cddar\|cdddar\|cddddr\|cdddr\|cddr\|cdr\|ceiling\)\>"
syn match   ssFunction      "\<\%(char->integer\|char-alphabetic?\|char-ci<=?\|char-ci<?\|char-ci=?\|char-ci>=?\|char-ci>?\|char-downcase\|char-foldcase\|char-lower-case?\)\>"
syn match   ssFunction      "\<\%(char-numeric?\|char-ready?\|char-upcase\|char-upper-case?\|char-whitespace?\|char<=?\|char<?\|char=?\|char>=?\|char>?\)\>"
syn match   ssFunction      "\<\%(char?\|close-input-port\|close-output-port\|close-port\|command-line\|complex?\|cons\|cos\|current-error-port\|current-input-port\)\>"
syn match   ssFunction      "\<\%(current-jiffy\|current-output-port\|current-second\|delete-file\|denominator\|digit-value\|display\|dynamic-wind\|emergency-exit\|environment\)\>"
syn match   ssFunction      "\<\%(eof-object\|eof-object?\|eq?\|equal?\|eqv?\|error\|error-object-irritants\|error-object-message\|error-object?\|eval\)\>"
syn match   ssFunction      "\<\%(even?\|exact\|exact->inexact\|exact-integer-sqrt\|exact-integer?\|exact?\|exit\|exp\|expt\|features\)\>"
syn match   ssFunction      "\<\%(file-error?\|file-exists?\|finite?\|floor\|floor-quotient\|floor-remainder\|floor/\|flush-output-port\|for-each\|force\)\>"
syn match   ssFunction      "\<\%(gcd\|get-environment-variable\|get-environment-variables\|get-output-bytevector\|get-output-string\|imag-part\|inexact\|inexact->exact\|inexact?\|infinite?\)\>"
syn match   ssFunction      "\<\%(input-port-open?\|input-port?\|integer->char\|integer?\|interaction-environment\|jiffies-per-second\|lcm\|length\|list\|list->string\)\>"
syn match   ssFunction      "\<\%(list->vector\|list-copy\|list-ref\|list-set!\|list-tail\|list?\|load\|log\|magnitude\|make-bytevector\)\>"
syn match   ssFunction      "\<\%(make-list\|make-parameter\|make-polar\|make-promise\|make-rectangular\|make-string\|make-vector\|map\|max\|member\)\>"
syn match   ssFunction      "\<\%(memq\|memv\|min\|modulo\|nan?\|negative?\|newline\|not\|null-environment\|null?\)\>"
syn match   ssFunction      "\<\%(number->string\|number?\|numerator\|odd?\|open-binary-input-file\|open-binary-output-file\|open-input-bytevector\|open-input-file\|open-input-string\|open-output-bytevector\)\>"
syn match   ssFunction      "\<\%(open-output-file\|open-output-string\|output-port-open?\|output-port?\|pair?\|peek-char\|peek-u8\|port?\|positive?\|procedure?\)\>"
syn match   ssFunction      "\<\%(promise?\|quotient\|raise\|raise-continuable\|rational?\|rationalize\|read\|read-bytevector\|read-bytevector!\|read-char\)\>"
syn match   ssFunction      "\<\%(read-error?\|read-line\|read-string\|read-u8\|real-part\|real?\|remainder\|reverse\|round\|scheme-report-environment\)\>"
syn match   ssFunction      "\<\%(set-car!\|set-cdr!\|sin\|sqrt\|square\|string\|string->list\|string->number\|string->symbol\|string->utf8\)\>"
syn match   ssFunction      "\<\%(string->vector\|string-append\|string-ci<=?\|string-ci<?\|string-ci=?\|string-ci>=?\|string-ci>?\|string-copy\|string-copy!\|string-downcase\)\>"
syn match   ssFunction      "\<\%(string-fill!\|string-foldcase\|string-for-each\|string-length\|string-map\|string-ref\|string-set!\|string-upcase\|string<=?\|string<?\)\>"
syn match   ssFunction      "\<\%(string=?\|string>=?\|string>?\|string?\|substring\|symbol->string\|symbol=?\|symbol?\|syntax-error\|tan\)\>"
syn match   ssFunction      "\<\%(textual-port?\|transcript-off\|transcript-on\|truncate\|truncate-quotient\|truncate-remainder\|truncate/\|u8-ready?\|utf8->string\|values\)\>"
syn match   ssFunction      "\<\%(vector\|vector->list\|vector->string\|vector-append\|vector-copy\|vector-copy!\|vector-fill!\|vector-for-each\|vector-length\|vector-map\)\>"
syn match   ssFunction      "\<\%(vector-ref\|vector-set!\|vector?\|with-exception-handler\|with-input-from-file\|with-output-to-file\|write\|write-bytevector\|write-char\|write-shared\)\>"
syn match   ssFunction      "\<\%(write-simple\|write-string\|write-u8\|zero?\)\>"

" ========================================================================= "
hi def link ssParens        Special
hi def link ssBegin         Special
hi def link ssCondParens    Statement
hi def link ssArgsParens    Variable
hi def link ssQuote         Special
hi def link ssDelimiter     Label
hi def link ssComment       Comment
hi def link ssBoolean       Boolean
hi def link ssInteger       Number
hi def link ssRational      Number
hi def link ssReal          Number
hi def link ssComplex       Number
hi def link ssCharacter     Character
hi def link ssEscape        SpecialChar
hi def link ssString        String
hi def link ssSymbol        Variable
hi def link ssVector        Special
hi def link ssStatement     Statement
hi def link ssDefine        Statement
hi def link ssVariable      Variable
hi def link ssParameter     Parameter
hi def link ssLet           Variable
hi def link ssSet           Statement
hi def link ssConditional   Conditional
hi def link ssRepeat        Repeat
hi def link ssLibrary       Statement
hi def link ssSyntax        Macro
hi def link ssOperator      Function
hi def link ssFunction      Function

" ========================================================================= "
let b:current_syntax = 'scheme'
if main_syntax == 'scheme'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
