" Vim syntax file
" Language:	Python
" Maintainer:	Rinz
" Last Change:	2020 Jul 17

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


" ========================================================================= "
syn keyword pythonStatement as break continue del exec global
syn keyword pythonStatement nonlocal pass return with yield
syn keyword pythonStatement	nextgroup=pythonFunction skipwhite
syn keyword pythonStatement	__new__ __init__ super all any
syn keyword pythonRepeat	for while if else elif
syn keyword pythonOperator	and in is not or
syn keyword pythonException	assert except finally raise try
syn match   pythonExcepting	"\%(except.*as\s*\)\@<=\<\w*\>"
syn match   pythonExcepting	"\%(raise\s*\)\@<=\<\w*\>"
syn keyword pythonInclude	from import
syn match   pythonModule	"\%(from\s*\)\@<=\<\w*\>"
syn match   pythonModule	"\%(import\s*\)\@<=\<\w*\>"
syn match   pythonModule	"\%(import\s*\%(\w*,\)*\)\@<=\<\w*\>"
syn match   pythonModule	"\%(import\s*\w*\s*as\s*\)\@<=\<\w*\>"
syn match   pythonModule	"\%(import\s*\)\@<=\*"
syn keyword pythonAsync		async await
syn keyword pythonConstant	False None True NotImplemented Ellipsis __debug__
syn match   pythonConstant	"\.\.\."
syn keyword pythonDef 		class def lambda cdef cpdef
syn keyword pythonType		int float complex bool list tuple range str slice
syn keyword pythonType		bytes bytearray	memoryview set frozenset dict
syn keyword pythonType		types enumerate Enum property
syn match   pythonType      "\%(id\|type\)\s*("me=e-1
syn match   pythonClass		"\%(\.\s*\)\@<!\<\%([A-Z]\|_[A-Z]\)\w*\>\s*[\:(]"me=e-1
syn match   pythonMagic		"__\w*__"
syn keyword pythonArg		object self other cls
syn match   pythonArg		"cls()"
syn match   pythonArg		"\%(,\s*\/\|\*\s*,\)\%(.*:$\)\@="   " def func(self,/,a,b,*,c):
syn match   pythonArg		"\*args\|\*\*kwargs"
syn match   pythonArg		"\%(\*\|\*\*\)\s*\<\w*\>\%(.*:$\)\@="
syn match   pythonArgs		"\%((.*,\s*\)\@<=\<\w*\>\s*=\%(.*:$\)\@!"
syn match   pythonArgs		"\%(,\s*\/\|\*\s*,\)"
syn match   pythonArgs		"\%(mode\|end\|stop\|step\|sep\)="
syn keyword pythonTodo		FIXME NOTE NOTES TODO XXX contained
syn match   pythonFunction	"\h\w*" display contained
syn match   pythonComment	"#.*$" contains=pythonTodo,@Spell

" Built-in functions
syn match   pythonBuiltin	"\%(\<\)\@<=\%(abs\|ascii\|bin\|breakpoint\|callable\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(chr\|compile\|delattr\|dir\|divmod\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(eval\|exec\|filter\|format\|getattr\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(globals\|hasattr\|hash\|help\|hex\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(input\|isinstance\|issubclass\|len\|locals\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(map\|max\|min\|next\|oct\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(open\|ord\|pow\|print\|repr\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(reversed\|round\|setattr\|sorted\|sum\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\<\)\@<=\%(vars\|zip\|__import__\|iter\)\s*("me=e-1
" Built-in methods
syn match   pythonBuiltin	"\%(\.append\|\.clear\|\.count\|\.copy\|\.extend\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.index\|\.insert\|\.pop\|\.remove\|\.sort\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.fromkeys\|\.get\|\.items\|\.iterkeys\|\.keys\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.popitem\|\.setdefault\|\.update\|\.values\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.capitalize\|\.casefold\|\.center\|\.encode\|\.endswith\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.find\|\.format_map\|\.isalnum\|\.isalpha\|\.isdecimal\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.isdigit\|\.isidentifier\|\.islower\|\.isnumeric\|\.isprintable\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.isspace\|\.istitle\|\.isupper\|\.join\|\.ljust\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.lower\|\.lstrip\|\.maketrans\|\.partition\|\.replace\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.rfind\|\.rindex\|\.rjust\|\.rpartition\|\.rstrip\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.rsplit\|\.split\|\.splitlines\|\.startswith\|\.strip\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.swapcase\|\.title\|\.translate\|\.upper\|\.zfill\)\s*("me=e-1
syn match   pythonBuiltin	"\%(\.removeprefix\|\.removesuffix\|mapping\|bit_count\)\s*("me=e-1
" Python 2 only
syn keyword pythonBuiltin	basestring cmp execfile file
syn keyword pythonBuiltin raw_input reload xrange
" Python 3 only
syn keyword pythonBuiltin apply buffer coerce intern

" syn keyword pythonDef class def nextgroup=pythonFunction skipwhite
" syn match   pythonFunction	"\<\([a-z]\|_[a-z]\)\w*\>\s*("me=e-1

" Decorators
syn match   pythonDecorator	"@" display contained
syn match   pythonDecoratorName	"@\s*\h\%(\w\|\.\)*" display contains=pythonDecorator

" Multiplication.
syn match   pythonMatrixMultiply
      \ "\%(\w\|[])]\)\s*@"
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction,pythonDoctestValue
      \ transparent
syn match   pythonMatrixMultiply
      \ "[^\\]\\\s*\n\%(\s*\.\.\.\s\)\=\s\+@"
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction,pythonDoctestValue
      \ transparent
syn match   pythonMatrixMultiply
      \ "^\s*\%(\%(>>>\|\.\.\.\)\s\+\)\=\zs\%(\h\|\%(\h\|[[(]\).\{-}\%(\w\|[])]\)\)\s*\n\%(\s*\.\.\.\s\)\=\s\+@\%(.\{-}\n\%(\s*\.\.\.\s\)\=\s\+@\)*"
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction,pythonDoctestValue
      \ transparent

" Triple-quoted strings can contain doctests.
syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,@Spell
syn region  pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=[rRfFb]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=[rRfFb]\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonSpaceError,pythonDoctest,@Spell

syn match   pythonEscape	+\\[abfnrtv'"\\]+ contained
syn match   pythonEscape	"\\\o\{1,3}" contained
syn match   pythonEscape	"\\x\x\{2}" contained
syn match   pythonEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match   pythonEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   pythonEscape	"\\$"

syn match   pythonNumber	"\<0[oO]\=\o\+[Ll]\=\>"
syn match   pythonNumber	"\<0[xX]\x\+[Ll]\=\>"
syn match   pythonNumber	"\<0[bB][01]\+[Ll]\=\>"
syn match   pythonNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   pythonNumber	"\%(\%(=\|,\|\[\|:\)\s*\)\@<=-\<\d\+\%(\.\d\+\)\=\>"
syn match   pythonNumber	"\<\d\+[jJ]\>"
syn match   pythonNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   pythonNumber	"\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   pythonNumber	"\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

" builtin base exceptions (used mostly as base classes for other exceptions)
syn keyword pythonExceptions	BaseException Exception
syn keyword pythonExceptions	ArithmeticError BufferError
syn keyword pythonExceptions	LookupError
" builtin base exceptions removed in Python 3
syn keyword pythonExceptions	EnvironmentError StandardError
" builtin exceptions (actually raised)
syn keyword pythonExceptions	AssertionError AttributeError
syn keyword pythonExceptions	EOFError FloatingPointError GeneratorExit
syn keyword pythonExceptions	ImportError IndentationError
syn keyword pythonExceptions	IndexError KeyError KeyboardInterrupt
syn keyword pythonExceptions	MemoryError NameError NotImplementedError
syn keyword pythonExceptions	OSError OverflowError ReferenceError
syn keyword pythonExceptions	RuntimeError StopIteration SyntaxError
syn keyword pythonExceptions	SystemError SystemExit TabError TypeError
syn keyword pythonExceptions	UnboundLocalError UnicodeError
syn keyword pythonExceptions	UnicodeDecodeError UnicodeEncodeError
syn keyword pythonExceptions	UnicodeTranslateError ValueError
syn keyword pythonExceptions	ZeroDivisionError
" builtin OS exceptions in Python 3
syn keyword pythonExceptions	BlockingIOError BrokenPipeError
syn keyword pythonExceptions	ChildProcessError ConnectionAbortedError
syn keyword pythonExceptions	ConnectionError ConnectionRefusedError
syn keyword pythonExceptions	ConnectionResetError FileExistsError
syn keyword pythonExceptions	FileNotFoundError InterruptedError
syn keyword pythonExceptions	IsADirectoryError NotADirectoryError
syn keyword pythonExceptions	PermissionError ProcessLookupError
syn keyword pythonExceptions	RecursionError StopAsyncIteration
syn keyword pythonExceptions	TimeoutError
" builtin exceptions deprecated/removed in Python 3
syn keyword pythonExceptions	IOError VMSError WindowsError
" builtin warnings
syn keyword pythonExceptions	BytesWarning DeprecationWarning FutureWarning
syn keyword pythonExceptions	ImportWarning PendingDeprecationWarning
syn keyword pythonExceptions	RuntimeWarning SyntaxWarning UnicodeWarning
syn keyword pythonExceptions	UserWarning Warning
" builtin warnings in Python 3
syn keyword pythonExceptions	ResourceWarning

syn match   pythonSpaceError	display excludenl "\s\+$"
syn match   pythonSpaceError	display " \+\t"
syn match   pythonSpaceError	display "\t\+ "

syn region pythonDoctest
    \ start="^\s*>>>\s" end="^\s*$"
    \ contained contains=ALLBUT,pythonDoctest,pythonFunction,@Spell
syn region pythonDoctestValue
    \ start=+^\s*\%(>>>\s\|\.\.\.\s\|"""\|'''\)\@!\S\++ end="$"
    \ contained
syn region pythonDoctest
    \ start="^\s*>>>" end="^\s*$"
    \ contained contains=@NoSpell

" Sync at the beginning of class, function, or method definition.
" syn sync match pythonSync grouphere NONE "^\%(def\|class\)\s\+\h\w*\s*[(:]"

" NumPy
syn match   numpyType      "\%(numpy\.int_\|numpy\.intc\|numpy\.intp\|numpy\.int8\|numpy\.int16\|numpy\.int32\|numpy\.int64\)"
syn match   numpyType      "\%(numpy\.uint_\|numpy\.uint16\|numpy\.uint32\|numpy\.uint64\)"
syn match   numpyType      "\%(numpy\.float_\|numpy\.float16\|numpy\.float32\|numpy\.float64\)"
syn match   numpyType      "\%(numpy\.complex_\|numpy\.complex64\|numpy\.complex128\|numpy\.bool_\)"
syn match   numpyType      "\%(np\.int_\|np\.intc\|np\.intp\|np\.int8\|np\.int16\|np\.int32\|np\.int64\)"
syn match   numpyType      "\%(np\.uint_\|np\.uint16\|np\.uint32\|np\.uint64\)"
syn match   numpyType      "\%(np\.float_\|np\.float16\|np\.float32\|np\.float64\)"
syn match   numpyType      "\%(np\.complex_\|np\.complex64\|np\.complex128\|np\.bool_\)"
syn match   numpyType      "\%(numpy\.array\|np\.array\|numpy\.ndarray\|np\.ndarray\)\s*("me=e-1
syn match   numpyType      "\%(np\.ones\|np\.zeros\|np\.random\.random\)\s*("me=e-1
syn match   numpyBuiltin   "\%(dot\|T\)\s*("me=e-1

" Collections
syn match   pyCollections  "\%(Counter\|defaultdict\|OrderedDict\|namedtuple\|deque\|ChainMap\|array\.array\)\s*("me=e-1
syn match   pyCollections  "\%(collections\.Counter\|collections\.defaultdict\|collections\.OrderedDict\|collections\.namedtuple\|collections\.deque\|collections\.ChainMap\)\s*("me=e-1
syn match   pyCollections  "\%(array\.array\)\s*("me=e-1

" Other Functions
syn match   pyFunctions    "\%(functools\.reduce\|reduce\)\s*("me=e-1

" ========================================================================= "
hi def link pythonNumber			Number
hi def link pythonType				Number
hi def link pythonDef				Number
hi def link pythonMagic				Number
hi def link pythonString			String
hi def link pythonQuotes			String
hi def link pythonConstant			Constant
hi def link pythonArg				Constant
hi def link pythonArgs				FuncArgs
hi def link pythonStatement			Statement
hi def link pythonRepeat			StatementItalic
hi def link pythonOperator			Statement
hi def link pythonInclude			Statement
hi def link pythonAsync				Statement
hi def link pythonDecorator			Statement
hi def link pythonDecoratorName			Statement
hi def link pythonException			StatementCyan
hi def link pythonFunction			Normal
hi def link pythonClass				Comment
hi def link pythonComment			Comment
hi def link pythonTodo				Todo
hi def link pythonTripleQuotes			pythonQuotes
hi def link pythonBuiltin			Builtin
hi def link pythonModule			Builtin
hi def link pythonExceptions			Exception
hi def link pythonExcepting			Exception
hi def link pythonSpaceError			Exception
hi def link pythonEscape			Special
hi def link pythonDoctest			Special
hi def link pythonDoctestValue	Define

hi def link numpyType               Number
hi def link pyCollections           Number
hi def link pyFunctions             Builtin

let b:current_syntax = "python"
let &cpo = s:cpo_save
unlet s:cpo_save
