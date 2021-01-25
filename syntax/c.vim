" Vim syntax file
" Language:     C
" Maintainer:   Rinz
" Last Change:  2020 Sep 9


if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'C'
elseif exists('b:current_syntax') && b:current_syntax == 'C'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn match   cIdentifier     "\w\+"
syn match   cSymbol         "\%(!\|@\|#\|$\|%\|^\|&\|\*\|(\|)\)"
syn match   cSymbol         "\%(`\|\~\|+\|-\|=\|{\|}\|\[\|\]\|\\\||\)"
syn match   cSymbol         +\%(;\|:\|'\|"\|.\|,\|<\|>\|\/\|?\)+

syn region  cComment        start="//" end="$" skip="\\$" keepend contains=cSpecialComment
syn region  cComment        start="/\*" end="\*/" contains=cSpecialComment
syn match   cVimCmd         "^//.*\%(ex\|vi\|vim\)\s*:.*$" contained

syn match   cConstant       "\%(\<\)\@<=_\=[_A-Z][_A-Z]\+\>\%(\s*(\)\@!"
syn match   cNumber         "\<\d\+\%(\.\d\+\)\=[fF]\=\>"
syn match   cNumber         "\<\d\+\%(\.\d\+\)\=[uU]\=[lL]\=[lL]\="
syn match   cNumber         "\<\.\d\+[fF]\=\>"
syn match   cNumber         "\%(\%(=\|?\|:\|,\|{\|(\|\s\)\s*\)\@<=-\<\d\+\%(\.\d\+\)\=\>"
syn match   cNumber         "\<\d\%(\.\d\+\)\=[eE][+-]\=\d\+[fF]\=\>"
syn match   cNumber         "\<\.\d\+[eE][+-]\=\d\+[fF]\=\>"
syn match   cNumber         "\<0\o\+\>"
syn match   cNumber         "\<0[bB]\[01]\+\>"
syn match   cNumber         "\<0[xX]\x\+\>"
syn match   cNumber         "\<0[xX]\x\%(\.\x\+\)\=[pP][+-]\=\d\+\>"
syn match   cNumber         "\<0[xX]\.\x\+[pP][+-]\=\d\+\>"
syn region  cCharacter      start="'" end="'" oneline
syn region  cString         start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cEscape,cFormat extend
syn match   cFormat         display "%\%(\d\+\$\)\=[-+' #0*]*\%(\d*\|\*\|\*\d\+\$\)\%(\.\%(\d*\|\*\|\*\d\+\$\)\)\=\%([hlLjzt]\|ll\|hh\)\=\%([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match   cFormat         display "%%" contained
syn match   cEscape         "\\\%(\o\{1,3}\|[xX]\x\{2}\|\\\|\'\|\"\|?\)"
syn match   cEscape         "\\[abfnrtv]"
syn keyword cBoolean        true false


" cType (signed|unsigned)\?\s+(short|long|long\s+long)\?(char|double|float|int|void)(?=(\s*\*+\w|\s+\w|\s*$|\s*(|\s*{))
" syn match   cXXX            "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)"
" syn match   cXXX            "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char"
" syn match   cXXX            "\%(\<\)\@<=\%(long\s\+\)\=double"
" syn match   cXXX            "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int"
" syn match   cXXX            "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)"
" syn match   cXXX            "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\="
syn match   cType           "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
syn match   cType           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
syn match   cType           "\%(\<\)\@<=\%(long\s\+\)\=double\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
syn match   cType           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
syn match   cType           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
syn match   cType           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
" cGenericType (?<=(^|,)\s*)type\s*:
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\s*\**\s*:"
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\s*\**\s*:"
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(long\s\+\)\=double\s*\**\s*:"
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*\**\s*:"
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*\**\s*:"
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*\**\s*:"
" cSpecialType type\s*\*+(?=\s+\w)
syn match   cSpecialType    "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\s*\*\+\%(\s\+\w\)\@="
syn match   cSpecialType    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\s*\*\+\%(\s\+\w\)\@="
syn match   cSpecialType    "\%(\<\)\@<=\%(long\s\+\)\=double\s*\*\+\%(\s\+\w\)\@="
syn match   cSpecialType    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*\*\+\%(\s\+\w\)\@="
syn match   cSpecialType    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*\*\+\%(\s\+\w\)\@="
syn match   cSpecialType    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*\*\+\%(\s\+\w\)\@="
" cppReference type\s*&
syn match   cppReference    "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\s*&"
syn match   cppReference    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\s*&"
syn match   cppReference    "\%(\<\)\@<=\%(long\s\+\)\=double\s*&"
syn match   cppReference    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*&"
syn match   cppReference    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*&"
syn match   cppReference    "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*&"
" csSpecialType type\s*\[\](?=\s+\w)
syn match   csSpecialType   "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\s*\[\]\%(\s\+\s\)\@="
syn match   csSpecialType   "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\s*\[\]\%(\s\+\s\)\@="
syn match   csSpecialType   "\%(\<\)\@<=\%(long\s\+\)\=double\s*\[\]\%(\s\+\s\)\@="
syn match   csSpecialType   "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*\[\]\%(\s\+\s\)\@="
syn match   csSpecialType   "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*\[\]\%(\s\+\s\)\@="
syn match   csSpecialType   "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*\[\]\%(\s\+\s\)\@="
" cArgs (const\s+)?type\s*\**(\s*(restrict|volatile))?(?=\s*(,|\)))
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(void\|bool\|float\|signed\|unsigned\)\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(\%(signed\|unsigned\)\s\+\)\=char\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(long\s\+\)\=double\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\|>\)\)\@="
" cArgs type\s*\[\](?=\s*(,|\)))
syn match   cArgs           "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\s*\[\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\s*\[\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(long\s\+\)\=double\s*\[\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*\[\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*\[\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*\[\]\%(\s*\%(,\|)\|>\)\)\@="
" cArgs type\s*\(\*\)\[\d+\](?=\s*(,|\)))
syn match   cArgs           "\%(\<\)\@<=\%(void\|bool\|float\|signed\|unsigned\)\s*()\[\d\+\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=char\s*()\[\d\+\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(long\s\+\)\=double\s*()\[\d\+\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*()\[\d\+\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*()\[\d\+\]\%(\s*\%(,\|)\|>\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*()\[\d\+\]\%(\s*\%(,\|)\|>\)\)\@="
" cTypeCasting\(\s*type\s*\**\)(?=\s*(\*?\w|\())
syn match   cTypeCasting    "(\s*\%(void\|bool\|float\|signed\|unsigned\)\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*\%(\%(signed\|unsigned\)\s\+\)\=char\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*\%(long\s\+\)\=double\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*\%(\%(signed\|unsigned\)\s\+\)\=\%(\%(long\|short\)\s\+\)\=int\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*\%(\%(signed\|unsigned\)\s\+\)\=\%(long\|short\)\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*\%(\%(signed\|unsigned\)\s\+\)\=long\s\+long\%(\s\+int\)\=\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*\%(struct\|union\|enum\)\s\+\w\+\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="
syn match   cTypeCasting    "(\s*[A-Z_]\w*\s*\**)\%(\s*\%(\**\w\|(\|&\)\)\@="

syn keyword cStorageClass   extern register static _Thread_local thread_local
syn keyword cSpecifier      inline _Alignas alignas _Atomic _Noreturn noreturn __attribute__
syn match   cSpecifier      "\%(\<\)\@<=\%(const\|volatile\)\%(\%(\s\|\*\)\)\@="
syn match   cSpecifier      "\*\+\s*\%(const\|restrict\|volatile\)\%(\s\)\@="
syn match   cSpecifier      "\%(\*\s*\)\@<=restrict\%(\s\|,\|(\|)\)\@="
syn keyword cppAutoType     auto
syn keyword cTypeDef        typedef

syn keyword cStatement      break case continue default goto return
syn keyword cConditonal     if else switch
syn keyword cRepeat         do for while
syn match   cRepeatDelim    "\%(^for.*\)\@<=;"
syn match   cLabel          "^\<\w\+\>\s*:\s*$"
syn match   cLabel          "\%(goto\s*\)\@<=\<\w\+\>"

syn keyword cOperator       sizeof typeof _Alignof alignof _Generic generic _Static_assert static_assert __real__ __imag__
syn match   cOperator       "\%(&&\|||\|!\|?\|#\)"
syn match   cOperator       "\%(:\)\@<!:\%(:\)\@!"
syn match   cOperator       "\%(-\)\@<!\%(>\|<\)\%(>\|<\)\@!"
syn match   cOperator       "\%(==\|!=\|>=\|<=\)"
syn match   cParens         "\%(\%(for\|while\|switch\)\s*\)\@<=("
syn match   cParens         "\%(\%(for\|while\|switch\).*\)\@<=)\%(\%(\s*{\)\=\s*$\)\@="
syn match   cSemicolon      "\%(\%(for\|while\|switch\).*\)\@<=;"
syn match   cBraces         "^[\{\}]$"
" syn match   cOperator       "\%(\w\s*\)\@<=\%(>\|<\)\%(\s*\%(\w\|\d\|\'\)\)\@="
syn match   cSizeof         "\%(sizeof\s*(\s*\)\@<=\%(\%(struct\|union\|enum\)\s\+\)\=\w\+\s*\**\%(\s*)\)\@="
syn match   cSizeof         "\%(sizeof\s\+\)\@<=\%(\%(struct\|union\|enum\)\s\+\)\=\w\+\%(\>\)\@="
syn match   cSizeofBrackets "\%(sizeof\s*\)\@<=(\%(\s*\%(\%(struct\|union\|enum\)\s\+\)\=\w\+\s*\**\s*)\)\@="
syn match   cSizeofBrackets "\%(sizeof\s*(\s*\%(\%(struct\|union\|enum\)\s\+\)\=\w\+\s*\**\s*\)\@<=)"

syn match   cStructure      "\%(\<\)\@<=[A-Z_]\w*\%(\%(\s*\*\+\w\|\s\+\w\|\s*$\|\s*;\|\s*(\s*\*\)\)\@="
syn match   cGenericStrc    "\%(\%(^\|,\)\s*\)\@<=[A-Z_]\w*\**\s*:"
syn match   cSpecialStrc    "\%(\<\)\@<=[A-Z_]\w*\s*\*\+\%(\%(\s\+\w\)\|\s*$\)\@="
syn match   cStrcArgs       "\%(\<\)\@<=\%([A-Z_]\w*\)\s*\**\%(\s*\%(,\|)\)\)\@="
syn match   cStruct         "\%(\<\)\@<=struct\%(\>\)\@="
syn match   cUnion          "\%(\<\)\@<=union\%(\>\)\@="
syn match   cEnum           "\%(\<\)\@<=enum\%(\>\)\@="
syn match   cStruct         "\%(\<struct\s\+\)\@<=\w\+\**\%(\s\|{\|$\|;\)\@="
syn match   cUnion          "\%(\<union\s\+\)\@<=\w\+\**\%(\s\|{\|$\|;\)\@="
syn match   cEnum           "\%(\<enum\s\+\)\@<=\w\+\**\%(\s\|{\|$\|;\)\@="
syn match   cGenericS       "\%(\%(^\|,\)\s*struct\s\+\)\@<=\w\+\**\s*:"
syn match   cGenericU       "\%(\%(^\|,\)\s*union\s\+\)\@<=\w\+\**\s*:"
syn match   cGenericE       "\%(\%(^\|,\)\s*enum\s\+\)\@<=\w\+\**\s*:"

syn match   cPointer        "(\s*\*\%(\s*\w\+\s*)\s*(\)\@="
syn match   cPointer        "\%((\s*\*\s*\w\+\s*\)\@<=)\%(\s*(\)\@="

syn match   cPreProc        "#\%(line\|error\|pragma\)"
syn match   cInclude        "^#include"
syn match   cModule         "\%(^#include\s*\)\@<=<.*>"
syn match   cDefine         "^#\%(define\|undef\)"
syn match   cPreCondit      "#\%(ifdef\|ifndef\|if\|else\|elif\|endif\|line\|error\|pragma\)"
syn match   cMacro          "\%(^#define\s\)\@<=\S*\s"
syn match   cMacro          "\%(\<\)\@<=_\=[_A-Z][_A-Z]\+\%(\s*(\)\@="
syn match   cMacro          "\%(^\s*\)\@<=[_A-Z]\w*\%(\s*\\$\)\@="
syn keyword cMacro          __LINE__ __FILE__ __DATE__ __TIME__ __FUNCTION__ __VER__ __func__ __VA_ARGS__

" ADT (\b\w_t\b)
syn match   cAdtType        "\%(\<\)\@<=\%(\w\+_[Tt]\>\)\%(\s*\*\+\w\|\s\+\w\|\s*$\|s*(\|\s*{\)\@="
syn match   cGenericType    "\%(\%(^\|,\)\s*\)\@<=\%(\<\w\+_[Tt]\>\)\s*\**\s*:"
syn match   cSpecialType    "\%(\<\)\@<=\%(\w\+_[Tt]\>\)\s*\*\+\%(\s\+\w\)\@="
syn match   cppReference    "\%(\<\)\@<=\%(\w\+_[Tt]\>\)\s*&"
syn match   csSpecialType   "\%(\<\)\@<=\%(\w\+_[Tt]\>\)\s*\[\]\%(\s\+\s\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(\<\w\+_[Tt]\>\)\s*\**\%(\s*\%(restrict\|volatile\)\)\=\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\w\+_[Tt]\>\)\s*\[\]\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(\w\+_[Tt]\>\)\s*()\[\d\+\]\%(\s*\%(,\|)\)\)\@="
syn match   cTypeCasting    "(\s*\%(\<\w\+_[Tt]\>\)\s*\**)\%(\s*\%(\**\w\|(\)\)\@="

syn keyword cOther          asm __asm__
syn match   cMain           "\%(\s\|^\)main("me=e-1
" (?<=sizeof\s*)\(((struct|union|enum)\s+)?\w+\s*\**\)"

" ========================================================================= "
" assert.h
syn match   cLibMacro       "\%(\<\)\@<=assert\s*("me=e-1
syn keyword cLibMacro       NDEBUG
" ctype.h
syn match   cLibFunc        "\%(\<\)\@<=\%(isalnum\|isalpha\|iscntrl\|isdigit\|isgraph\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(islower\|isprint\|ispunct\|isspace\|isupper\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(isxdigit\|tolower\|toupper\)\s*("me=e-1
" errno.h
syn keyword cLibMacro       errno EDOM ERANGE
" float.h
syn keyword cLibMacro       FLT_ROUNDS FLT_RADIX
syn keyword cLibMacro       FLT_MANT_DIG DBL_MANT_DIG LDBL_MANT_DIG
syn keyword cLibMacro       FLT_DIG DBL_DIG LDBL_DIG
syn keyword cLibMacro       FLT_EPSILON DBL_EPSILON LDBL_EPSILON
syn keyword cLibMacro       FLT_MIN DBL_MIN LDBL_MIN
syn keyword cLibMacro       FLT_MIN_EXP DBL_MIN_EXP LDBL_MIN_EXP
syn keyword cLibMacro       FLT_MIN_10_EXP DBL_MIN_10_EXP LDBL_MIN_10_EXP
syn keyword cLibMacro       FLT_MAX DBL_MAX LDBL_MAX
syn keyword cLibMacro       FLT_MAX_EXP DBL_MAX_EXP LDBL_MAX_EXP
syn keyword cLibMacro       FLT_MAX_10_EXP DBL_MAX_10_EXP LDBL_MAX_10_EXP
" limits.h
syn keyword cLibMacro       CHAR_BIT CHAR_MIN CHAR_MAX SCHAR_MIN SCHAR_MAX UCHAR_MAX
syn keyword cLibMacro       MB_LEN.MAX SHRT_MIN SHRT_MAX USHRT_MAX
syn keyword cLibMacro       INT_MIN INT_MAX UINT_MAX LONG_MIN LONG_MAX ULONG_MAX
" locale.h
syn keyword cLibMacro       LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY LC_NUMERIC LC_TIME
syn match   cLibFunc        "\%(\<\)\@<=\%(setlocale\|lconv\)\s*("me=e-1
syn keyword cLibType        lconv
" math.h
syn keyword cLibMacro       HUGE_VAL
syn match   cLibFunc        "\%(\<\)\@<=\%(acos\|asin\|atan\|atan2\|cos\|cosh\|sin\|sinh\tan\|tanh\|exp\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(frexp\|ldexp\|log\|log10\|modf\|pow\|sqrt\ceil\|fabs\|floor\|fmod\)\s*("me=e-1
" setjmp.h
syn keyword cLibType        jmp_buf
syn match   cLibMacro       "\%(\<\)\@<=setjmp\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=longjmp\s*("me=e-1
" signal.h
syn keyword cLibType        sig_atomic_t
syn keyword cLibMacro       SIG_DFL SIG_ERR SIG_IGN
syn keyword cLibMacro       SIGABRT SIGFPE SIGILL SIGINT SIGSEGV SIGTERM
syn match   cLibFunc        "\%(\<\)\@<=\%(signal\|raise\)\s*("me=e-1
" stdarg.h
syn keyword cLibType        va_list
syn match   cLibMacro       "\%(\<\)\@<=\%(va_start\|va_arg\|va_end\|va_copy\)\s*("me=e-1
" stddef.h
" syn keyword cFormat         size_t
syn keyword cLibType        ptrdiff_t wchar_t wint_t
syn keyword cLibMacro       NULL
syn match   cLibMacro       "offsetof\s*("me=e-1
" stdio.h
syn keyword cLibType        FILE fpos_t
syn keyword cLibMacro       _IOFBF _IOLBF _IONBF BUFSIZ EOF FOPEN_MAX FILENAME_MAX
syn keyword cLibMacro       L-tmpnam SEEK_CUR SEEK_END SEEK_SET TMP_MAX stderr stdin stdout
syn match   cLibFunc        "\%(\<\)\@<=\%(fclose\|clearerr\|feof\|ferror\|fflush\|fgetpos\|fopen\|fread\|freopen\|fseek\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(fsetpos\|ftell\|fwrite\|remove\|rename\|rewind\|setbuf\|setvbuf\|tmpfile\|tmpnam\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(fprintf\|printf\|sprintf\|vfprintf\|vprintf\|vsprintf\|fscanf\|scanf\|sscanf\|fgetc\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(fgets\|fputc\|fputs\|getc\|getchar\|gets\|putc\|putchar\|puts\|ungetc\|perror\|snprintf\)\s*("me=e-1
" stdlib.h
syn keyword cLibType        div_t ldiv_t
syn keyword cLibMacro       EXIT_FAILURE EXIT_SUCCESS RAND_MAX MB_CUR_MAX
syn match   cLibFunc        "\%(\<\)\@<=\%(atof\|atoi\|atol\|strtod\|strtol\|strtoul\|calloc\|free\|malloc\|realloc\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(abort\|atexit\|exit\|getenv\|system\|bsearch\|qsort\|abs\|div\|labs\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(ldiv\|rand\|srand\|mblen\|mbstowcs\|mbtowc\|wsctombs\|wctomb\)\s*("me=e-1
" string.h
syn match   cLibFunc        "\%(\<\)\@<=\%(memchr\|memcmp\|memcpy\|memmove\|memset\|strcat\|strncat\|strchr\|strcmp\|strncmp\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(strcoll\|strcpy\|strncpy\|strcspn\|strerror\|strlen\|strpbrk\|strrchr\|strspn\|strstr\)\s*("me=e-1
syn match   cLibFunc        "\%(\<\)\@<=\%(strtok\|strxfrm\)\s*("me=e-1
" time.h
syn keyword cLibType        clock_t time_t tm
syn keyword cLibMacro       CLOCK_PER_SEC
syn match   cLibFunc        "\%(\<\)\@<=\%(asctime\|clock\|ctime\|difftime\|gmtime\|localtime\|mktime\|strftime\|time\)\s*("me=e-1
" fenc.h
syn keyword cLibType        fenv_t fexcept_t
syn keyword cLibMacro       FE_DIVBYZERO FE_INEXACT FE_INVALTD FE_OVERFLOW FE_UNDERFILW FE_ALL_EXCEPT FE_DOWNWARD FE_TONEAREST FE_TOWARDZERO FE_UPWARD FE_DFL_ENV
" iso646.h
syn keyword cLibOpr         and or not compl bitand bitor xor and_eq or_eq not_eq xor_eq


syn keyword cLibType        int8_t int16_t int32_t int64_t uint8_t uint16_t uint32_t uint64_t char16_t char32_t
syn keyword cLibType        int8 int16 int32 int64 uint uint8 uint16 uint32 uint64 float16 float32 float64 char8 char16 char32 uchar uchar8 uchar16 uchar32
syn keyword cLibType        _Bool _Complex complex _Imaginary imaginary

" ========================================================================= "
"class"
syn match   cSelfPtr        "\**\<\%(self\|other\|cls\|me\|this\|that\)\>"
syn match   cAttrs          "\%(this\|that\|me\)\s*->"
syn match   cMethod         "->\%(\w\+\s*\.\)\=\s*vptr\s*->"
syn match   cMethod         "\%(self\|me\)\s*->\s*\%(\w\+\s*\.\s*\)\=vptr\%(\%(\s*=\|;\)\)\@="
syn match   cMethod         "\*\=\%(self\|me\)\s*->\%(\w\+\s*\.\s*\)\=\s*vptr\s*->\%(\s*\w\)\@="
syn match   cVTable         "\w\+_vtbl"
syn match   cVTable         "\<vtbl\>"
syn match   cArg            "\%(->\s*vptr\s*->\s*\w\+(\)\@<=\w\+\%(->\w\+\)*\%(\s*,\|\s*)\)\@="
syn match   cAttrs          "self\s*->\%(\s*vptr\)\@!"

" ========================================================================= "
hi def link cIdentifier     Identifier
hi def link cSymbol         Symbol
hi def link cKeyword        Keyword
hi def link cComment        Comment
hi def link cVimCmd         SpecialComment
hi def link cConstant       Constant
hi def link cNumber         Number
hi def link cCharacter      Character
hi def link cString         String
hi def link cFormat         SpecialChar
hi def link cEscape         SpecialChar
hi def link cBoolean        Boolean
hi def link cType           Type
hi def link cGenericType    Type
hi def link cSpecialType    SpecialType
hi def link cppReference    SpecialType
hi def link csSpecialType   SpecialType
hi def link cArgs           Argument
hi def link cTypeCasting    Special
hi def link cStorageClass   StorageClass
hi def link cSpecifier      Specifier
hi def link cppAutoType     Type
hi def link cTypeDef        Typedef
hi def link cStatement      Statement
hi def link cConditonal     Conditional
hi def link cRepeat         Repeat
hi def link cRepeatDelim    Statement
hi def link cLabel          Label
hi def link cOperator       Operator
hi def link cParens         Operator
hi def link cSemicolon      Operator
hi def link cBraces         Function
hi def link cSizeof         SpecialItalic
hi def link cSizeofBrackets Special
hi def link cStructure      Structure
hi def link cGenericStrc    Structure
hi def link cSpecialStrc    SpecialType
hi def link cStrcArgs       Argument
hi def link cStruct         String
hi def link cUnion          Function
hi def link cEnum           Number
hi def link cGenericS       String
hi def link cGenericU       Function
hi def link cGenericE       Number
hi def link cPointer        Structure
hi def link cPreProc        PreProc
hi def link cInclude        Include
hi def link cDefine         Define
hi def link cModule         Module
hi def link cPreCondit      PreCondit
hi def link cMacro          Macro
hi def link cMain           Statement
hi def link cAdtType        SpecialType
hi def link cOther          Others
hi def link cLibMacro       Macro
hi def link cLibFunc        Function
hi def link cLibType        SpecialType
hi def link cLibOpr         Operator
hi def link cSelfPtr        SelfRef
hi def link cAttrs          SelfRef
hi def link cMethod         Methond
hi def link cVTable         Structure

" ========================================================================= "
let b:current_syntax = 'C'
if main_syntax == 'C'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
