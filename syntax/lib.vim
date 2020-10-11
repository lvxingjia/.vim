syn keyword cType           size_t wchar_t
syn keyword cMacro          NULL

" assert.h
syn match   cBuiltin        "assert\s*("me=e-1
syn keyword cMacro          NDEBUG
" cMacro cConstant cIdentifier"
" ctype.h
syn match   cBuiltin        "\%(isalnum\|isalpha\|iscntrl\|isdigit\|isgraph\)\s*("me=e-1
syn match   cBuiltin        "\%(islower\|isprint\|ispunct\|isspace\|isupper\)\s*("me=e-1
syn match   cBuiltin        "\%(isxdigit\|tolower\|toupper\)\s*("me=e-1
" errno.h
syn keyword cMacro          errno EDOM ERANGE
" float.h
syn keyword cMacro          FLT_ROUNDS FLT_RADIX FLT_MANT_DIG DBL_MANT_DIG LDBL_MANT_DIG
syn keyword cMacro          FLT_DIG DBL_DIG LDBL_DIG FLT_EPSILON DBL_EPSILON LDBL_EPSILON
syn keyword cMacro          FLT_MIN DBL_MIN LDBL_MIN FLT_MAX DBL_MAX LDBL_MAX
syn keyword cMacro          FLT_MIN_EXP DBL_MIN_EXP LDBL_MIN_EXP FLT_MIN_10_EXP DBL_MIN_10_EXP LDBL_MIN_10_EXP
syn keyword cMacro          FLT_MAX_EXP DBL_MAX_EXP LDBL_MAX_EXP FLT_MAX_10_EXP DBL_MAX_10_EXP LDBL_MAX_10_EXP
" limits.h
syn keyword cMacro          CHAR_BIT SCHAR_MIN SCHAR_MAX UCHAR_MAX CHAR_MIN CHAR_MAX MB_LEN_MAX
syn keyword cMacro          SHRT_MIN SHRT_MAX USHRT_MAX INT_MIN INT_MAX UINT_MAX LONG_MIN LONG_MAX ULONG_MAX
" locale.h
syn keyword cMacro          LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY LC_NUMERIC LC_TIME
syn match   cBuiltin        "\%(setlocale\|lconv\)\s*("me=e-1
" math.h
syn keyword cMacro          HUGE_VAL
syn match   cBuiltin        "\%(acos\|asin\|atan\|atan2\|cos\|cosh\|sin\|sinh\tan\|tanh\|exp\)\s*("me=e-1
syn match   cBuiltin        "\%(frexp\|ldexp\|log\|log10\|modf\|pow\|sqrt\ceil\|fabs\|floor\|fmod\)\s*("me=e-1
" setjmp.h
syn keyword cType           jmp_buf
syn match   cBuiltin        "\%(setjmp\|longjmp\)\s*("me=e-1
" signal.h
syn keyword cType           sig_atomic_t
syn keyword cMacro          SIG_DFL SIG_ERR SIG_IGN SIGABRT SIGFPE SIGILL SIGINT SIGSEGV SIGTERM
syn match   cBuiltin        "\%(signal\|raise\)\s*("me=e-1
" stdarg.h
syn keyword cType           va_list
syn match   cBuiltin        "\%(va_start\|va_arg\|va_end\)\s*("me=e-1
" stddef.h
syn keyword cType           ptrdiff_t
syn match   cBuiltin        "offsetof\s*("me=e-1
" stdio.h
syn keyword cType           FILE fpos_t
syn keyword cMacro          _IOFBF _IOLBF _IONBF BUFSIZ EOF FOPEN_MAX FILENAME_MAX L_tmpnam
syn keyword cMacro          SEEK_CUR SEEK_END SEEK_SET TMP_MAX stderr stdin stdout
syn match   cBuiltin        "\%(fclose\|clearerr\|feof\|ferror\|fflush\|fgetpos\|fopen\|fread\|freopen\|fseek\)\s*("me=e-1
syn match   cBuiltin        "\%(fsetpos\|ftell\|fwrite\|remove\|rename\|rewind\|setbuf\|setvbuf\|tmpfile\|tmpnam\)\s*("me=e-1
syn match   cBuiltin        "\%(fprintf\|printf\|sprintf\|vfprintf\|vprintf\|vsprintf\|fscanf\|scanf\|sscanf\|fgetc\)\s*("me=e-1
syn match   cBuiltin        "\%(fgets\|fputc\|fputs\|getc\|getchar\|gets\|putc\|putchar\|puts\|ungetc\|perror\|sniprintf\)\s*("me=e-1
" stdlib.h
syn keyword cType           div_t ldiv_t
syn keyword cMacro          EXIT_FAILURE EXIT_SUCCESS RAND_MAX MB_CUR_MAX
syn match   cBuiltin        "\%(atof\|atoi\|atol\|strtod\|strtol\|strtoul\|calloc\|free\|malloc\|realloc\)\s*("me=e-1
syn match   cBuiltin        "\%(abort\|atexit\|exit\|getenv\|system\|bsearch\|qsort\|abs\|div\|labs\)\s*("me=e-1
syn match   cBuiltin        "\%(ldiv\|rand\|srand\|mblen\|mbstowcs\|mbtowc\|wsctombs\|wctomb)\s*("me=e-1
" string.h
syn match   cBuiltin        "\%(memchr\|memcmp\|memcpy\|memmove\|memset\|strcat\|strncat\|strchr\|strcmp\|strncmp\)\s*("me=e-1
syn match   cBuiltin        "\%(strcoll\|strcpy\|strncpy\|strcspn\|strerror\|strlen\|strpbrk\|strrchr\|strspn\|strstr\)\s*("me=e-1
syn match   cBuiltin        "\%(strtok\|strxfrm)\s*("me=e-1

" time.h

syn keyword cType           clock_t time_t
syn keyword cMacro          CLOCKS_PER_SEC
syn match   cBuiltin        "\%(asctime\|clock\|ctime\|difftime\|gmtime\|localtime\|mktime\|strftime\|time)\s*("me=e-1
