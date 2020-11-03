" Vim syntax file
" Language:	C
" Maintainer:	Rinz
" Last Change:	2020 Sep 9

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "

" C11 keywords
syn keyword cStorageClass   auto extern register static _Thread_local
syn keyword cQualifiedType  inline _Alignas _Atomic _Noreturn
syn match   cQualifiedType  "\%(\<\)\@<=\%(const\|volatile\)\%(\%(\s\|\*\)\)\@="
syn match   cQualifiedType  "\*\+\s*\%(const\|restrict\|volatile\)\%(\s\)\@="
syn match   cQualifiedType  "\%(\*\s*\)\@<=restrict\%(\s\|,\|(\|)\)\@="
syn keyword cTypeDef        typedef
syn keyword cStatement      break case continue default goto return
syn match   cType           "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\%(\%(\s*\*\+\w\|\s\+\w\|\s*$\|\s*(\|\s*{\)\)\@="
syn match   cppReference    "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*&"
syn match   cSpecialType    "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\*\+\%(\s\+\w\)\@="
syn match   cSpecialType    "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\[\]\%(\s\+\w\)\@="

" syn keyword cBasicType      long short signed unsigned
syn keyword cSpecialType    _Bool bool _Complex complex _Imaginary imaginary
syn match   cArgs           "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\**\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\[\]\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*(\*)\[\d\+\]\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\.\.\.\)\%()\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(struct\|union\|enum\)\s\+\w\+\s*\**\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=[A-Z_]\w*\s*\*\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\**\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\**\s*\%(restrict\|volatile\)\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\**\%(\s*\%(,\|)\)\)\@="
syn match   cArgs           "\%(\<\)\@<=\%(const\s\+\)\=\%(char\|double\|float\|int\|void\|short\|long\|signed\|unsigned\)\s*\**\s*\%(restrict\|volatile\)\%(\s*\%(,\|)\)\)\@="


syn keyword cRepeat         do else for if switch while
syn keyword cOperator       sizeof typeof _Alignof alignof _Generic _Static_assert
syn match   cOperator       "\%(&&\|||\|!\|?\|:\|#\)"
syn match   cOperator       "\%(==\|!=\|>=\|<=\)"
syn match   cOperator       "\%(\w\s*\)\@<=\%(>\|<\)\%(\s*\w\)\@="
syn keyword cConstant       true false
syn match   cMain           "\%(\s\)main("me=e-1

syn match   cTypeCasing     "(\%(char\|double\|float\|int\|void\)\**)\%(\s*\*\=\w\|\s*&\)\@="
syn match   cTypeCasing     "(\%(struct\|union\|enum\)\s\+\w\+\*)\%(\%(\s*\*\=\w\|\s*$\|\s*{\)\)\@="
syn match   cTypeCasing     "([A-Z_]\w*\*)\%(\%(\s*\*\=\w\|\s*$\)\)\@="

syn region  cComment        start="//" end="$" skip="\\$" keepend
syn region  cComment        start="/\*" end="\*/"
syn region  cCharacter      start="'" end="'"

syn region  cString         start=+\%(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=cEscape,cFormat,@Spell extend
syn region  cString         start=+\%(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cEscape,cFormat,@Spell
syn match   cFormat         display "%\%(\d\+\$\)\=[-+' #0*]*\%(\d*\|\*\|\*\d\+\$\)\%(\.\%(\d*\|\*\|\*\d\+\$\)\)\=\%([hlLjzt]\|ll\|hh\)\=\%([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match   cFormat         display "%%" contained
syn match   cEscape         "\\\%(\o\{1,3}\|[xX]\x\{2}\|\\\|\'\|\"\|?\)"
syn match   cEscape         "\\[abfnrtv]"

syn match   cStructName     "\%(\<\)\@<=[A-Z_]\w*\%(\%(\s*\*\+\w\|\s\+\w\|\s*$\|\s*;\|\s*)\)\)\@="
syn match   cStructName     "\%((\s*\)\@<=[A-Z_]\w*\%(\s*)\)\@="
syn match   cStructName     "\<[A-Z_]\w*\%(\s*(\s*\*\)\@="
syn match   cSpecialName    "\%(\<\)\@<=[A-Z_]\w*\s*\*\+\%(\s\+\w\)\@="
syn match   cStruct         "struct"
syn match   cUnion          "union"
syn match   cEnum           "enum"
syn match   cStruct         "\%(\<struct\s\+\)\@<=\w\+\**\%(\s\|{\|;\|$\)\@="
syn match   cUnion          "\%(\<union\s\+\)\@<=\w\+\**\%(\s\|{\|;\|$\)\@="
syn match   cEnum           "\%(\<enum\s\+\)\@<=\w\+\**\%(\s\|{\|;\|$\)\@="

syn match   cPointer        "(\s*\*\%(\s*\w\+\s*)\s*(\)\@="
syn match   cPointer        "\%((\s*\*\s*\w\+\s*\)\@<=)\%(\s*(\)\@="
"class"
syn match   cArg            "\**\<\%(self\|other\|cls\|me\)\>"
syn match   cPoint          "\%(this\|that\|me\)\s*->"
syn match   cMethod         "->\%(\w\+\s*\.\)\=\s*vptr\s*->"
syn match   cMethod         "\%(self\|me\)\s*->\s*\%(\w\+\s*\.\s*\)\=vptr\%(\%(\s*=\|;\)\)\@="
syn match   cMethod         "\*\=\%(self\|me\)\s*->\%(\w\+\s*\.\s*\)\=\s*vptr\s*->\%(\s*\w\)\@="
syn match   cVTable         "\w\+_vtbl"
syn match   cVTable         "\<vtbl\>"
syn match   cArg            "\%(->\s*vptr\s*->\s*\w\+(\)\@<=\w\+\%(->\w\+\)*\%(\s*,\|\s*)\)\@="
syn match   cAttrs          "self\s*->\%(\s*vptr\)\@!"

syn match   cNumber         "\<\d\+\%(\.\d\+\)\=[fF]\=\>"
syn match   cNumber         "\<\d\%(\.\d\+\)\=[eE][+-]\=\d\+[fF]\=\>"
syn match   cNumber         "\<\.\d\+[eE][+-]\=\d\+[fF]\=\>"
syn match   cNumber         "\<0[xX]\x\%(\.\x\+\)\=[pP][+-]\=\d\+\>"
syn match   cNumber         "\<0[xX]\.\x\+[pP][+-]\=\d\+\>"
syn match   cNumber         "\%(\%(=\|?\|:\|,\|{\)\s*\)\@<=-\<\d\+\%(\.\d\+\)\=\>"
syn match   cNumber         "\%(\d\)\@<=[lLuU]"
syn match   cNumber         "\%(\d\)\@<=\%(ll\|LL\)"
syn match   cNumber         "\%(\d\)\@<=\%([lL][uU]\|[uU][lL]\|[uU]ll\|[uU]LL\|ll[uU]\|LL[uU]\)"
syn match   cNumber         "\<0\o\+\>"
syn match   cNumber         "\<0[xX]\x\+\>"
syn match   cNumber         "\<0[bB]\[01]\+\>"

syn match   cInclude        "^#include"
syn match   cIncluded       "\%(^#include\s*\)\@<=<.*>"
syn match   cPreProc        "#\%(define\|undef\|ifdef\|ifndef\|if\|else\|elif\|endif\|line\|error\|pragma\)"
syn match   cMacro          "\%(^#define\s\)\@<=\S*\s"
syn match   cLabel          "^\<\w\+\>\s*:"
syn match   cLabel          "\%(goto\s*\)\@<=\<\w\+\>"


" assert.h
syn match   cMacro          "\%(\<\)\@<=assert\s*("me=e-1
syn keyword cMacro          NDEBUG
" ctype.h
syn match   cBuiltin        "\%(\<\)\@<=\%(isalnum\|isalpha\|iscntrl\|isdigit\|isgraph\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(islower\|isprint\|ispunct\|isspace\|isupper\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(isxdigit\|tolower\|toupper\)\s*("me=e-1
" errno.h
syn keyword cMacro          errno EDOM ERANGE
" float.h
syn keyword cMacro          FLT_ROUNDS FLT_RADIX
syn keyword cMacro          FLT_MANT_DIG DBL_MANT_DIG LDBL_MANT_DIG
syn keyword cMacro          FLT_DIG DBL_DIG LDBL_DIG
syn keyword cMacro          FLT_EPSILON DBL_EPSILON LDBL_EPSILON
syn keyword cMacro          FLT_MIN DBL_MIN LDBL_MIN
syn keyword cMacro          FLT_MIN_EXP DBL_MIN_EXP LDBL_MIN_EXP
syn keyword cMacro          FLT_MIN_10_EXP DBL_MIN_10_EXP LDBL_MIN_10_EXP
syn keyword cMacro          FLT_MAX DBL_MAX LDBL_MAX
syn keyword cMacro          FLT_MAX_EXP DBL_MAX_EXP LDBL_MAX_EXP
syn keyword cMacro          FLT_MAX_10_EXP DBL_MAX_10_EXP LDBL_MAX_10_EXP
" limits.h
syn keyword cMacro          CHAR_BIT CHAR_MIN CHAR_MAX SCHAR_MIN SCHAR_MAX UCHAR_MAX
syn keyword cMacro          MB_LEN.MAX SHRT_MIN SHRT_MAX USHRT_MAX
syn keyword cMacro          INT_MIN INT_MAX UINT_MAX LONG_MIN LONG_MAX ULONG_MAX
" locale.h
syn keyword cMacro          LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY LC_NUMERIC LC_TIME
syn match   cBuiltin        "\%(\<\)\@<=\%(setlocale\|lconv\)\s*("me=e-1
syn keyword cSpecialType    lconv
" math.h
syn keyword cMacro          HUGE_VAL
syn match   cBuiltin        "\%(\<\)\@<=\%(acos\|asin\|atan\|atan2\|cos\|cosh\|sin\|sinh\tan\|tanh\|exp\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(frexp\|ldexp\|log\|log10\|modf\|pow\|sqrt\ceil\|fabs\|floor\|fmod\)\s*("me=e-1
" setjmp.h
syn keyword cSpecialType    jmp_buf
syn match   cMacro          "\%(\<\)\@<=setjmp\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=longjmp\s*("me=e-1
" signal.h
syn keyword cSpecialType    sig_atomic_t
syn keyword cMacro          SIG_DFL SIG_ERR SIG_IGN
syn keyword cMacro          SIGABRT SIGFPE SIGILL SIGINT SIGSEGV SIGTERM
syn match   cBuiltin        "\%(\<\)\@<=\%(signal\|raise\)\s*("me=e-1
" stdarg.h
syn keyword cSpecialType    va_list
syn match   cMacro          "\%(\<\)\@<=\%(va_start\|va_arg\|va_end\|va_copy\)\s*("me=e-1
" stddef.h
syn keyword cSpecialType    wchar_t size_t ptrdiff_t
syn keyword cMacro          NULL
syn match   cMacro          "offsetof\s*("me=e-1
" stdio.h
syn keyword cSpecialType    FILE fpos_t
syn keyword cMacro          _IOFBF _IOLBF _IONBF BUFSIZ EOF FOPEN_MAX FILENAME_MAX
syn keyword cMacro          L-tmpnam SEEK_CUR SEEK_END SEEK_SET TMP_MAX stderr stdin stdout
syn match   cBuiltin        "\%(\<\)\@<=\%(fclose\|clearerr\|feof\|ferror\|fflush\|fgetpos\|fopen\|fread\|freopen\|fseek\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(fsetpos\|ftell\|fwrite\|remove\|rename\|rewind\|setbuf\|setvbuf\|tmpfile\|tmpnam\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(fprintf\|printf\|sprintf\|vfprintf\|vprintf\|vsprintf\|fscanf\|scanf\|sscanf\|fgetc\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(fgets\|fputc\|fputs\|getc\|getchar\|gets\|putc\|putchar\|puts\|ungetc\|perror\|snprintf\)\s*("me=e-1
" stdlib.h
syn keyword cSpecialType    div_t ldiv_t
syn keyword cMacro          EXIT_FAILURE EXIT_SUCCESS RAND_MAX MB_CUR_MAX
syn match   cBuiltin        "\%(\<\)\@<=\%(atof\|atoi\|atol\|strtod\|strtol\|strtoul\|calloc\|free\|malloc\|realloc\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(abort\|atexit\|exit\|getenv\|system\|bsearch\|qsort\|abs\|div\|labs\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(ldiv\|rand\|srand\|mblen\|mbstowcs\|mbtowc\|wsctombs\|wctomb\)\s*("me=e-1
" string.h
syn match   cBuiltin        "\%(\<\)\@<=\%(memchr\|memcmp\|memcpy\|memmove\|memset\|strcat\|strncat\|strchr\|strcmp\|strncmp\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(strcoll\|strcpy\|strncpy\|strcspn\|strerror\|strlen\|strpbrk\|strrchr\|strspn\|strstr\)\s*("me=e-1
syn match   cBuiltin        "\%(\<\)\@<=\%(strtok\|strxfrm\)\s*("me=e-1
" time.h
syn keyword cSpecialType    clock_t time_t tm
syn keyword cMacro          CLOCK_PER_SEC
syn match   cBuiltin        "\%(\<\)\@<=\%(asctime\|clock\|ctime\|difftime\|gmtime\|localtime\|mktime\|strftime\|time\)\s*("me=e-1

" ========================================================================= "
hi def link cStorageClass       Builtin
hi def link cQualifiedType      Builtin
hi def link cTypeDef            Builtin
hi def link cStatement          Statement
hi def link cRepeat             StatementItalic
hi def link cLabel              Constant
hi def link cPreProc            Statement
hi def link cType               Type
hi def link cNumber             Number
hi def link cOperator           Operator
hi def link cInclude            Include
hi def link cIncluded           String
hi def link cMacro              Macro
hi def link cConstant           Constant
hi def link cCharacter          Character
hi def link cString             String
hi def link cEscape             Special
hi def link cSpecialType        SpecialItalic
hi def link cBasicType          Type
hi def link cTypeCasing         Special
hi def link cFormat             Special
hi def link cComment            Comment
hi def link cMain               Statement
hi def link cppReference        SpecialItalic
hi def link cArgs               Constant
hi def link cSpecialName        SpecialItalic
hi def link cStructName         Special
hi def link cStruct             String
hi def link cUnion              Builtin
hi def link cEnum               Number
hi def link cAttrs              SpecialItalic
hi def link cMethod             Special
hi def link cVTable             Special
hi def link cPoint              Special
hi def link cPointer            Special

" ========================================================================= "
let b:current_syntax = "basic"
let &cpo = s:cpo_save
unlet s:cpo_save
