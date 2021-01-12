" Vim syntax file
" Language:     JavaScript
" Authon:       Rinz
" Create Time:  2020 Nec 24
" Last Change:  2020 Sep 9

" if exists("b:current_syntax")
"   finish
" endif
if !exists('main_syntax')
  " quit when a syntax file was already loaded
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'javascript'
elseif exists('b:current_syntax') && b:current_syntax == 'javascript'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
if main_syntax == "javascript"
syn match   jsSymbol        "\%(!\|@\|#\|$\|%\|^\|&\|\*\|(\|)\)"
syn match   jsSymbol        "\%(`\|\~\|+\|-\|=\|{\|}\|\[\|\]\|\\\||\)"
syn match   jsSymbol        +\%(;\|:\|'\|"\|.\|,\|<\|>\|\/\|?\)+
syn match   jsIdentifier    "\$\=\w\+"
endif

syn region  jsComment       start="/\*"  end="\*/" keepend
syn match   jsComment       "\/\/.*$"
syn match   jsNumber        "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match   jsNumber        "-\=\<\d\+\.\d\+\%([eE][+-]\=\d\+\)"
syn match   jsNumber        "-\=\<\d\+\.\d\+"
syn match   jsEscape        +\\['"\\nrtbf]+ contained
syn region  jsString        start=+"+  skip=+\\\\\|\\"+  end=+"\|$+ contains=jsEscape
syn region  jsString        start=+'+  skip=+\\\\\|\\"+  end=+'\|$+ contains=jsEscape
syn region  jsRegExpr       start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+ end=+/[gimuys]\{0,2\}\s*[;.,)\]}]+me=e-1 oneline
syn keyword jsBoolean       true false
syn keyword jsNull          null undefined

syn keyword jsStatement     return with break continue case default
syn keyword jsConditional   if else switch
syn keyword jsRepeat        while for do in
syn keyword jsOperator      new delete instanceof typeof
syn match   jsOperator      "\%(===\|==\|!==\|!=\|>=\|<=\|<\|>\)"
syn match   jsOperator      "\%(!\|&&\|||\)"
syn match   jsLabel         "\%(^\s*\)\@<=\w\+:\%(\s*$\)\@="
syn match   jsLabel         "\%(\%(break\|continue\)\s\+\)\@<=\w\+\%(\s*;\=\s*$\)\@="

syn keyword jsDeclare       var let
syn match   jsType          "\%(:\s*\)\@<=\%(Array|Boolean|Date|Function|Null|Number|Object|String|Symbol|RegExp|Undefined\)\>"
syn match   jsTypeCasting   "\%(\%(Array\|Boolean\|Date\|Function\|Null\|Number\|Object\|String\|Symbol\|RegExp\|Undefined\)\s*\)\@<=(\%(\w\)\@="
syn match   jsTypeCasting   "\%(\%(Array\|Boolean\|Date\|Function\|Null\|Number\|Object\|String\|Symbol\|RegExp\|Undefined\)\s*([^()]\+\)\@<=)"
syn keyword jsFuncDec       function
syn keyword jsFuncArg       arguments
syn keyword jsSelfRef       this that other

syn match   jsAttribute     +\%({.*\|^\s*\)\@<=\w\+\s*:+
syn keyword jsMessage       alert confirm prompt status
syn keyword jsGlobal        self window top parent
syn keyword jsMember        document event location
syn keyword jsException     try catch finally throw
syn match   jsInHTML        "\%(<!--\|-->\)"
syn keyword jsReserved      abstract boolean byte char const debugger double enum export final float goto implements import int interface long native package private protected public short synchronized throws transient volatile 
syn keyword jsClasses       class constructor static extends super


syn match   jsObjAttr       "\.\%(length\|global\|ignoreCase\|lastIndex\|multiline\|source\)"
syn match   jsObjAttr       "\.\%(E\|LN2\|LN10\|LOG2E\|LOG10E\|PI\|SQRT1_2\|SQRT2\)"
syn match   jsObjAttr       "\.\%(MAX_VALUE\|MIN_VALUE\|ENGATIVE_INFINITY\|POSITIVE_INFINITY\|NaN\|EPSILON\|MIN_SAFE_INTEGER\|MAX_SAFE_INTEGER\)"
syn match   jsObjMeth       "\.\%(abs\|acos\|asin\|atan\|atan2\|ceil\|charAt\|charCodeAt\|compile\|concat\)("me=e-1
syn match   jsObjMeth       "\.\%(copyWithin\|cos\|entries\|every\|exec\|exp\|fill\|filter\|find\|findIndex\)("me=e-1
syn match   jsObjMeth       "\.\%(floor\|forEach\|from\|fromCharCode\|getDate\|getDay\|getFullYear\|getHours\|getMilliseconds\|getMinutes\)("me=e-1
syn match   jsObjMeth       "\.\%(getMonth\|getSeconds\|getTime\|getTimezoneOffset\|getUTCDate\|getUTCDay\|getUTCFullYear\|getUTCHours\|getUTCMilliseconds\|getUTCMonth\)("me=e-1
syn match   jsObjMeth       "\.\%(getUTCSeconds\|getYear\|includes\|indexOf\|isArray\|isFinite\|isInteger\|isSafeInteger\|join\|keys\)("me=e-1
syn match   jsObjMeth       "\.\%(lastIndexOf\|log\|map\|match\|max\|min\|parse\|pop\|pow\|push\)("me=e-1
syn match   jsObjMeth       "\.\%(random\|reduce\|reduceRight\|repeat\|replace\|reverse\|round\|search\|setDate\|setFullYear\)("me=e-1
syn match   jsObjMeth       "\.\%(setHours\|setMilliseconds\|setMinutes\|setMonth\|setSeconds\|setTime\|setUTCDate\|setUTCFullYear\|setUTCHours\|setUTCMilliseconds\)("me=e-1
syn match   jsObjMeth       "\.\%(setUTCMinutes\|setUTCMonth\|setUTCSeconds\|setYear\|shift\|sin\|slice\|some\|sort\|splice\)("me=e-1
syn match   jsObjMeth       "\.\%(split\|sqrt\|startsWith\|substr\|substring\|tan\|test\|toDateString\|toExponential\|toFixed\)("me=e-1
syn match   jsObjMeth       "\.\%(toGMTString\|toISOString\|toJSON\|toLocaleDateString\|toLocaleLowerCase\|toLocaleString\|toLocaleTimeString\|toLocaleUpperCase\|toLowerCase\|toPrecision\)("me=e-1
syn match   jsObjMeth       "\.\%(toString\|toTimeString\|toUpperCase\|toUTCString\|trim\|unshift\|UTC\|valueOf\)("me=e-1
syn match   jsObjMeth       "\.\%(hasOwnProperty\)("me=e-1
syn match   jsStrHtmlMeth   "\.\%(anchor\|big\|blink\|bold\|fixed\|fontcolor\|fontsize\|italics\|link\|small\|strike\|sub\|sup\)("me=e-1
syn match   jsGlblFunc      "\%(decodeURI\|decodeURIComponent\|encodeURI\|encodeURIComponent\|escape\|eval\|isFinite\|isNaN\|parseFloat\|parseInt\|unescape\)("me=e-1


" syn match   jsWinAttr       "\.\%(closed\|defaultStatus\|document\|frames\|history\|innerHeight\|innerWidth\|localStorage\|\)"
syn match   jsWinMeth       "\.\%(close\|focus\|open\|stop\|write\|writeln\)("me=e-1

syn match   jsPrototype     "\.prototype\%(\.\)\="
syn match   jsPrototype     "Object.prototype"
syn match   jsFuncObject    "Function.prototype"
syn match   jsFuncApply     "\.apply("me=e-1
syn match   jsFuncCall      "\.call("me=e-1
syn match   jsObjCreate     "Object\.create("me=e-1

syn match   jsConstructor   "\%(\%(new\|var\|let\)\s\+\)\@<=\<[A-Z]\w*\>"
syn match   jsConstructor   "\<[A-Z]\w*\%(\.\)\@="
" ========================================================================= "
hi def link jsIdentifier    Identifier
hi def link jsSymbol        Symbol
hi def link jsComment       Comment
hi def link jsNumber        Number
hi def link jsEscape        SpecialChar
hi def link jsString        String
hi def link jsRegExpr       String
hi def link jsBoolean       Boolean
hi def link jsNull          Boolean
hi def link jsStatement     Statement
hi def link jsConditional   Conditional
hi def link jsRepeat        Repeat
hi def link jsOperator      Operator
hi def link jsLabel         Label
hi def link jsDeclare       Type
hi def link jsType          Type
hi def link jsTypeCasting   Type
hi def link jsFuncDec       Type
hi def link jsSelfRef       SelfRef
hi def link jsAttribute     Label
hi def link jsMember        Function
hi def link jsGlobal        Statement
hi def link jsDeprecated    Specifier
hi def link jsReserved      Tag
hi def link jsException     Exception
hi def link jsInHTML        Comment
hi def link jsObjAttr       Function
hi def link jsObjMeth       Function
hi def link jsStrHtmlMeth   Function
hi def link jsGlblFunc      Function
hi def link jsWinMeth       Function
hi def link jsClasses       Class
hi def link jsConstructor   Class
hi def link jsPrototype     Function
hi def link jsFuncObject    Function
hi def link jsFuncApply     Function
hi def link jsFuncCall      Function
hi def link jsObjCreate     Function
" ========================================================================= "
let b:current_syntax = 'javascript'
if main_syntax == 'javascript'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
