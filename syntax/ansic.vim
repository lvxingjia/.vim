" Vim syntax file
" Language:     ANSI C
" Author:       Rinz
" Create Time:  2021 May 18

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'ANSI C'
elseif exists('b:current_syntax') && b:current_syntax == 'ANSI C'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
" ========================================================================= "
syn region  cComment        start="//" end="$" skip="\\$" keepend contains=cVimCmd,cCommentTitle
syn region  cComment        start="/\*" end="\*/" contains=cVimCmd,cCommentTitle
syn match   cVimCmd         "\%(ex\|vi\|vim\)\s*:.*$" contained

syn match   cNumber         "\c\<\d\+u\=l\{,2}\>"
syn match   cNumber         "\c\<0b[01]\+\>"
syn match   cNumber         "\<0\o\+\>"
syn match   cNumber         "\c\<0x\x\+\>"
syn match   cFloat          "\c\%(\d\|\s\)\@<=\.\d\+\%(e[+-]\=\d\+\)\=f\=\>"
syn match   cFloat          "\c\%(\d\|\s\)\@<=\.\x\+\%(p[+-]\=\d\+\)\=f\=\>"
syn region  cCharacter      start=+'+ end=+'+ skip=+\\'+ contains=cEscape oneline
syn region  cString         start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cEscape,cFormat extend
syn match   cFormat         display "%\%(\d\+\$\)\=[-+' #0*]*\%(\d*\|\*\|\*\d\+\$\)\%(\.\%(\d*\|\*\|\*\d\+\$\)\)\=\%([hlLjzt]\|ll\|hh\)\=\%([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match   cFormat         display "%%" contained
syn match   cEscape         "\\\%(\o\{1,3}\|[xX]\x\{2}\|\\\|\'\|\"\|?\)"
syn match   cEscape         "\\[abfnrtv]"

syn keyword cStorageClass   extern static register
syn match   cSpecifier      "\*\=\<\%(const\|volatile\)\>"
syn keyword cType           int char float double void
syn keyword cType           long short signed unsigned
syn keyword cTypeDef        typedef
syn match   cBraces         "\%(\<typedef.*\)\@<=;"

syn keyword cOperator       sizeof typeof
syn match   cOperator       "\%(==\|!=\|&&\|||\|!\)"
syn region  cOperand        start="\%(\<sizeof\)\@<=(" end=")" oneline
syn region  cOperand        start="\%(\<sizeof\)\@<=\s" end="\s" skip="+\|-" oneline
syn match   cCondOper       "?"
syn match   cCondOper       "\%(:\)\@<!:\%(:\)\@!"

syn keyword cReturn         return
syn keyword cConditonal     if else switch
syn keyword cRepeat         do for while
syn match   cRepeatDelim    "\%(^\%(for\|while\)\>.*\)\@<=;"
syn keyword cLabel          break case continue default
syn match   cLabel          "\%(^\%(case\|default\)\)\@<=:\s*$"
syn match   cLabel          "\%(break\|continue\)\@<=;"
syn keyword cGoto           goto
syn match   cLabel          "^\<\w\+\>\s*:\s*$"
syn match   cLabel          "\%(goto\s\+\)\@<=\<\w\+\s*;"

syn match   cParens         "\%(\<\%(if\|for\|while\|switch\)\s*\)\@<=("
syn match   cParens         "\%(\<\%(if\|for\|while\|switch\)\>.*\)\@<=)\%(\%(\s*{\|;\|\\\)\=\s*\\\=$\)\@="
syn match   cSemicolon      "\%(\<\%(if\|for\|while\|switch\)\>.*\)\@<=;"
syn match   cSemicolon      "^\s*;$"
syn match   cBraces         "^{$"
syn match   cBraces         "\%(^\S.*\)\@<={$"
syn match   cBraces         "^}\|\%(^}.*\)\@<=;$"

syn match   cMacro          "#"
syn keyword cMacro          __LINE__ __FILE__ __DATE__ __TIME__ __FUNCTION__
syn keyword cMacro          __VA_ARGS__
syn match   cPreProc        "#\%(line\|error\|pragma\)\>"
syn match   cInclude        "#\s*include\>"
syn match   cDefine         "#\%(define\|undef\)\>"
syn match   cPreCondit      "#\%(ifdef\|ifndef\|if\|else\|elif\|endif\)\>"
syn match   cModule         "\%(#\s*include\s*\)\@<=<.*>"

syn match   cStructure      "\<\u\w*\>"
syn match   cConstant       "\<\u[0-9A-Z_]\+\>"
syn match   cMacro          "\%(#\%(define\|undef\|ifdef\|ifndef\)\s\+\)\@<=\w\+\%(\s\|$\)\@=" contains=cAdtType,cStructure,cConstant

syn keyword cStruct         struct
syn match   cStruct         "\%(\<struct\s\+\)\@<=\w\+\>"
syn keyword cUnion          union
syn match   cUnion          "\%(\<union\s\+\)\@<=\w\+\>"
syn match   cEnum           "\<enum\>"
syn match   cEnum           "\%(\<enum\s\+\)\@<=\w\+\>"

syn match   cMain           "\<main("me=e-1

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
syn match   cLibJump        "\%(\<\)\@<=\%(setjmp\|longjmp\)\s*("me=e-1
" signal.h
syn keyword cLibType        sig_atomic_t
syn keyword cLibMacro       SIG_DFL SIG_ERR SIG_IGN
syn keyword cLibMacro       SIGABRT SIGFPE SIGILL SIGINT SIGSEGV SIGTERM
syn match   cLibFunc        "\%(\<\)\@<=\%(signal\|raise\)\s*("me=e-1
" stdarg.h
syn keyword cLibType        va_list
syn match   cLibMacro       "\%(\<\)\@<=\%(va_start\|va_arg\|va_end\|va_copy\)\s*("me=e-1
syn match   cLibMacro       "\%((\|,\s*\)\@<=\.\.\.\%(\s*)\)\@="
" stddef.h
syn keyword cType           size_t wchar_t ssize_t rsize_t
syn keyword cLibType        ptrdiff_t wint_t
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
" unistd.h
syn match   cLibFunc        "\%(\<\)\@<=\%(read\|write\)\s*("me=e-1
" fcntl.h
syn match   cLibFunc        "\%(\<\)\@<=\%(open\|creat\|close\|unlink\)\s*("me=e-1

" ========================================================================= "
hi def link cComment        Comment
hi def link cVimCmd         VimCmd
hi def link cConstant       Constant
hi def link cNumber         Number
hi def link cFloat          Number
hi def link cCharacter      Character
hi def link cString         String
hi def link cFormat         Escape
hi def link cEscape         Escape
hi def link cType           Type
hi def link cStorageClass   StorageClass
hi def link cSpecifier      Specifier
hi def link cTypeDef        Typedef
hi def link cStatement      Statement
hi def link cReturn         Return
hi def link cConditonal     Conditional
hi def link cRepeat         Repeat
hi def link cLabel          Label
hi def link cGoto           Goto
hi def link cOperator       Operator
hi def link cOperand        Special
hi def link cCondOper       Branch
hi def link cParens         Statement
hi def link cSemicolon      Statement
hi def link cBraces         Function
hi def link cStructure      Structure
hi def link cStruct         Struct
hi def link cUnion          Variable
hi def link cEnum           Number
hi def link cPreProc        PreProc
hi def link cInclude        Include
hi def link cDefine         Define
hi def link cModule         Module
hi def link cPreCondit      PreCondit
hi def link cMacro          Macro
hi def link cMain           Statement
hi def link cLibMacro       Macro
hi def link cLibFunc        Function
hi def link cLibJump        Goto
hi def link cLibType        UserType

" ========================================================================= "
let b:current_syntax = 'ANSI C'
if main_syntax == 'ANSI C'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
