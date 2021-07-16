" Vim syntax file
" Language:     Python
" Author:       Rinz
" Create Time:  2020 Jul 17

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'python'
elseif exists('b:current_syntax') && b:current_syntax == 'python'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn match   pySymbol        "."
syn match   pyIdentifier    "\<\w\+\>"

syn match   pyComment       "#.*$"
syn match   pyVimCmd        "#.*\%(ex\|vi\|vim\)\s*:.*$" contained

syn keyword pyConstant      NotImplemented Ellipsis __debug__
syn match   pyConstant      "\.\.\."
syn keyword pyBoolean       True False None
syn match   pyNumber        "\<0[oO]\=\o\+[Ll]\=\>"
syn match   pyNumber        "\<0[xX]\x\+[Ll]\=\>"
syn match   pyNumber        "\<0[bB][01]\+[Ll]\=\>"
syn match   pyNumber        "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   pyNumber        "\%(\%(=\|,\|\[\|:\)\s*\)\@<=-\<\d\+\%(\.\d\+\)\=\>"
syn match   pyNumber        "\<\d\+[jJ]\>"
syn match   pyNumber        "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   pyNumber        "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   pyNumber        "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
syn match   pyEscape        +\\[abfnrtv'"\\]+ contained
syn match   pyEscape        "\\\o\{1,3}" contained
syn match   pyEscape        "\\x\x\{2}" contained
syn match   pyEscape        "\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match   pyEscape        "\\N{\a\+\%(\s\a\+\)*}" contained
syn match   pyEscape        "\\$" contained
syn region  pyString        start=+[uUrRfF]\='+ end=+'+ contains=pyEscape
syn region  pyString        start=+[uUrRfF]\="+ end=+"+ contains=pyEscape
syn region  pyDocString     start=+"""+ end=+"""+ contains=ALL
syn region  pyDocString     start=+'''+ end=+'''+ contains=ALL
syn match   pyDocTest       "^\s*>>>\s" contained

syn keyword pyType          int float complex bool list tuple range str slice
syn keyword pyType          bytes bytearray memoryview set frozenset dict
syn keyword pyType          types enumerate Enum property
syn match   pyType          "\<\%(id\|type\)\s*("me=e-1

syn match   pyStatement     "\%(^\s*\%(if\|else\|elif\|for\|while\)\>.*\)\@<=:"
syn keyword pyStatement     as break continue del exec global
syn keyword pyStatement     nonlocal pass return with yield
syn keyword pyStatement     __new__ __init__ super all any
syn match   pyConditional   "\<\%(if\|else\|elif\)\>"
syn match   pyRepeat        "\<\%(for\|while\)\>"
syn keyword pyOperator      and not or is
syn match   pySpecOper      "\%(^\s*\)\@<!\%(\<\%(if\|else\|for\|in\)\>\)"
syn match   pyOperator      "\%(for\>.*\)\@<=\<in\>"
syn keyword pyAsync         async await

syn match   pyDeclare       "\%(^\s*\%(def\|class\|cdef\|cpdef\)\>.*\)\@<=:"
syn keyword pyDeclare       def class lambda cdef cpdef
syn keyword pySelfRef       self other
syn match   pySelfRef       "cls\%(()\)\="
syn keyword pyBaseObject    object
syn match   pyVarArgs       "\*args\|\*\*kwargs"
syn match   pyArgDemlim     "\%(,\s*\/\|\*\s*,\)\%(.*:$\)\@="   " def func(self,/,a,b,*,c):
syn match   pyArgDemlim     "\%(\*\|\*\*\)\s*\<\w*\>\%(.*:$\)\@="
syn match   pyFuncArgs      "\%((.*,\s*\)\@<=\<\w*\>\s*=\%(.*:$\)\@!"
syn match   pyFuncArgs      "\%(,\s*\/\|\*\s*,\)"
syn match   pyFuncArgs      "\%(mode\|end\|stop\|step\|sep\)="
syn match   pyDecorator     "@" display contained
syn match   pyDecoratorName "@\s*\h\%(\w\|\.\)*" display contains=pythonDecorator

syn match   pyClass         "\%(\.\s*\)\@<!\<\%([A-Z]\|_[A-Z]\)\w*\>\s*[\:(]"me=e-1
syn match   pyMagic         "__\w*__"

syn keyword pyInclude       from import
syn match   pyModule        "\%(from\s*\)\@<=\<\w*\>"
syn match   pyModule        "\%(import\s*\)\@<=\<\w*\>"
syn match   pyModule        "\%(import\s*\%(\w*,\)*\)\@<=\<\w*\>"
syn match   pyModule        "\%(import\s*\w*\s*as\s*\)\@<=\<\w*\>"
syn match   pyModule        "\%(import\s*\)\@<=\*"

syn keyword pyException     assert except finally raise try
syn match   pyExceptName    "\%(except.*as\s*\)\@<=\<\w*\>"
syn match   pyExceptName    "\%(raise\s*\)\@<=\<\w*\>"
" ========================================================================= "
" ========================================================================= "

" Built-in functions
syn match   pyBuiltin       "\%(\<\)\@<=\%(abs\|ascii\|bin\|breakpoint\|callable\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(chr\|compile\|delattr\|dir\|divmod\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(eval\|exec\|filter\|format\|getattr\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(globals\|hasattr\|hash\|help\|hex\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(input\|isinstance\|issubclass\|len\|locals\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(map\|max\|min\|next\|oct\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(open\|ord\|pow\|print\|repr\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(reversed\|round\|setattr\|sorted\|sum\)\s*("me=e-1
syn match   pyBuiltin       "\%(\<\)\@<=\%(vars\|zip\|__import__\|iter\)\s*("me=e-1
" Built-in methods
syn match   pyBuiltin       "\%(\.append\|\.clear\|\.count\|\.copy\|\.extend\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.index\|\.insert\|\.pop\|\.remove\|\.sort\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.fromkeys\|\.get\|\.items\|\.iterkeys\|\.keys\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.popitem\|\.setdefault\|\.update\|\.values\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.capitalize\|\.casefold\|\.center\|\.encode\|\.endswith\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.find\|\.format_map\|\.isalnum\|\.isalpha\|\.isdecimal\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.isdigit\|\.isidentifier\|\.islower\|\.isnumeric\|\.isprintable\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.isspace\|\.istitle\|\.isupper\|\.join\|\.ljust\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.lower\|\.lstrip\|\.maketrans\|\.partition\|\.replace\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.rfind\|\.rindex\|\.rjust\|\.rpartition\|\.rstrip\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.rsplit\|\.split\|\.splitlines\|\.startswith\|\.strip\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.swapcase\|\.title\|\.translate\|\.upper\|\.zfill\)\s*("me=e-1
syn match   pyBuiltin       "\%(\.removeprefix\|\.removesuffix\|mapping\|bit_count\)\s*("me=e-1
" Python 2 only
syn keyword pyBuiltin       basestring cmp execfile file
syn keyword pyBuiltin       raw_input reload xrange
" Python 3 only
syn keyword pyBuiltin       apply buffer coerce intern

" builtin base exceptions (used mostly as base classes for other exceptions)
syn keyword pyExceptions    BaseException Exception
syn keyword pyExceptions    ArithmeticError BufferError
syn keyword pyExceptions    LookupError
" builtin base exceptions removed in Python 3
syn keyword pyExceptions    EnvironmentError StandardError
" builtin exceptions (actually raised)
syn keyword pyExceptions    AssertionError AttributeError
syn keyword pyExceptions    EOFError FloatingPointError GeneratorExit
syn keyword pyExceptions    ImportError IndentationError
syn keyword pyExceptions    IndexError KeyError KeyboardInterrupt
syn keyword pyExceptions    MemoryError NameError NotImplementedError
syn keyword pyExceptions    OSError OverflowError ReferenceError
syn keyword pyExceptions    RuntimeError StopIteration SyntaxError
syn keyword pyExceptions    SystemError SystemExit TabError TypeError
syn keyword pyExceptions    UnboundLocalError UnicodeError
syn keyword pyExceptions    UnicodeDecodeError UnicodeEncodeError
syn keyword pyExceptions    UnicodeTranslateError ValueError
syn keyword pyExceptions    ZeroDivisionError
" builtin OS exceptions in Python 3
syn keyword pyExceptions    BlockingIOError BrokenPipeError
syn keyword pyExceptions    ChildProcessError ConnectionAbortedError
syn keyword pyExceptions    ConnectionError ConnectionRefusedError
syn keyword pyExceptions    ConnectionResetError FileExistsError
syn keyword pyExceptions    FileNotFoundError InterruptedError
syn keyword pyExceptions    IsADirectoryError NotADirectoryError
syn keyword pyExceptions    PermissionError ProcessLookupError
syn keyword pyExceptions    RecursionError StopAsyncIteration
syn keyword pyExceptions    TimeoutError
" builtin exceptions deprecated/removed in Python 3
syn keyword pyExceptions    IOError VMSError WindowsError
" builtin warnings
syn keyword pyExceptions    BytesWarning DeprecationWarning FutureWarning
syn keyword pyExceptions    ImportWarning PendingDeprecationWarning
syn keyword pyExceptions    RuntimeWarning SyntaxWarning UnicodeWarning
syn keyword pyExceptions    UserWarning Warning
" builtin warnings in Python 3
syn keyword pyExceptions    ResourceWarning

" NumPy
syn match   numpyType       "\%(numpy\.int_\|numpy\.intc\|numpy\.intp\|numpy\.int8\|numpy\.int16\|numpy\.int32\|numpy\.int64\)"
syn match   numpyType       "\%(numpy\.uint_\|numpy\.uint16\|numpy\.uint32\|numpy\.uint64\)"
syn match   numpyType       "\%(numpy\.float_\|numpy\.float16\|numpy\.float32\|numpy\.float64\)"
syn match   numpyType       "\%(numpy\.complex_\|numpy\.complex64\|numpy\.complex128\|numpy\.bool_\)"
syn match   numpyType       "\%(np\.int_\|np\.intc\|np\.intp\|np\.int8\|np\.int16\|np\.int32\|np\.int64\)"
syn match   numpyType       "\%(np\.uint_\|np\.uint16\|np\.uint32\|np\.uint64\)"
syn match   numpyType       "\%(np\.float_\|np\.float16\|np\.float32\|np\.float64\)"
syn match   numpyType       "\%(np\.complex_\|np\.complex64\|np\.complex128\|np\.bool_\)"
syn match   numpyType       "\%(numpy\.array\|np\.array\|numpy\.ndarray\|np\.ndarray\)\s*("me=e-1
syn match   numpyType       "\%(np\.ones\|np\.zeros\|np\.random\.random\)\s*("me=e-1
syn match   numpyBuiltin    "\%(dot\|T\)\s*("me=e-1

" Collections
syn match   pyCollections   "\%(Counter\|defaultdict\|OrderedDict\|namedtuple\|deque\|ChainMap\|array\.array\)\s*("me=e-1
syn match   pyCollections   "\%(collections\.Counter\|collections\.defaultdict\|collections\.OrderedDict\|collections\.namedtuple\|collections\.deque\|collections\.ChainMap\)\s*("me=e-1
syn match   pyCollections   "\%(array\.array\)\s*("me=e-1

" Other Functions
syn match   pyFunctions     "\%(functools\.reduce\|reduce\)\s*("me=e-1
" ========================================================================= "
hi def link pyIdentifier    Identifier
hi def link pySymbol        Symbol
hi def link pyComment       Comment
hi def link pyVimCmd        VimCmd
hi def link pyConstant      Constant
hi def link pyBoolean       Boolean
hi def link pyNumber        Number
hi def link pyEscape        Escape
hi def link pyString        String
hi def link pyDocString     DocComment
hi def link pyDocTest       String
hi def link pyType          Type
hi def link pyStatement     Statement
hi def link pyConditional   Conditional
hi def link pyRepeat        Repeat
hi def link pyOperator      Operator
hi def link pySpecOper      Branch
hi def link pyAsync         Statement
hi def link pyDeclare       Type
hi def link pySelfRef       Parameter
hi def link pyBaseObject    Constant
hi def link pyVarArgs       Argument
hi def link pyArgDemlim     Argument
hi def link pyFuncArgs      Parameter
hi def link pyDecorator     Statement
hi def link pyDecoratorName Statement
hi def link pyClass         Class
hi def link pyMagic         Tag
hi def link pyInclude       Include
hi def link pyModule        Module
hi def link pyBuiltin       Function
hi def link pyException     Goto
hi def link pyExceptName    Exception
hi def link pyExceptions    Exception

hi def link pyCollections   Type
hi def link pyFunctions     Function
hi def link numpyType       Type
hi def link numpyBuiltin    Function

" ========================================================================= "
let b:current_syntax = 'python'
if main_syntax == 'python'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
