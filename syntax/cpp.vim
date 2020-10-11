" Vim syntax file
" Language:	Cpp
" Maintainer:	Rinz
" Last Change:	2020 Sep 9


if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
" runtime! syntax/c.vim
" C++ extensions


" ========================================================================= "
syn keyword cStorageClass   auto extern register static _Thread_local
syn keyword cQualifiedType  const volatile restrict inline _Alignas _Atomic _Noreturn
syn keyword cTypeDef        typedef
syn keyword cStatement      break case continue default goto return
syn keyword cType           char double float int long short signed unsigned void
syn keyword cType           _Bool bool _Complex complex _Imaginary imaginary
syn keyword cStructure      enum struct union
syn keyword cRepeat         do else for if switch while
syn keyword cOperator       sizeof _Alignof alignof _Generic _Static_assert
syn keyword cConstant       NULL true false
syn match   cMain           "\%(\s\)main("me=e-1

syn region  cComment        start="//" end="$" skip="\\$" keepend
syn region  cComment        start="/\*" end="\*/"
syn match   cCharacter      "'\w\?'"

syn region  cString         start=+\%(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell extend
syn region  cString         start=+\%(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,cFormat,@Spell
syn match   cFormat         display "%\%(\d\+\$\)\=[-+' #0*]*\%(\d*\|\*\|\*\d\+\$\)\%(\.\%(\d*\|\*\|\*\d\+\$\)\)\=\%([hlLjzt]\|ll\|hh\)\=\%([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match   cFormat         display "%%" contained
syn match   cSpecial        "\\\%(\o\{1,3}\|[xX]\x\{2}\|\\\|\'\|\"\|?\)"
syn match   cSpecial        "\\[abfnrtv]"

syn match   cNumber         "\<\d\+\%(\.\d\+\)\=[fF]\=\>"
syn match   cNumber         "\<\d\%(\.\d\+\)\=[eE][+-]\=\d\+[fF]\=\>"
syn match   cNumber         "\<\.\d\+[eE][+-]\=\d\+[fF]\=\>"
syn match   cNumber         "\<0[xX]\x\%(\.\x\+\)\=[pP][+-]\=\d\+\>"
syn match   cNumber         "\<0[xX]\.\x\+[pP][+-]\=\d\+\>"
syn match   cNumber         "\%(\%(=\|,\|{\)\s*\)\@<=-\<\d\+\%(\.\d\+\)\=\>"
syn match   cNumber         "\%(\d\)\@<=[lLuU]"
syn match   cNumber         "\%(\d\)\@<=\%(ll\|LL\)"
syn match   cNumber         "\%(\d\)\@<=\%([lL][uU]\|[uU][lL]\|[uU]ll\|[uU]LL\|ll[uU]\|LL[uU]\)"
syn match   cNumber         "\<0\o\+\>"
syn match   cNumber         "\<0[xX]\x\+\>"
syn match   cNumber         "\<0[bB]\[01]\+\>"

syn match   cInclude        "^#include"
syn match   cIncluded       "\%(^#include\)\@<=<.*>"
syn match   cPreProc        "#\%(define\|undef\|if\|ifdef\|ifndef\|else\|elif\|endif\|line\|error\|pragma\)"
syn match   cMacro          "\%(^#define\s\)\@<=\S*\s"
syn match   cLabel          "^\<\w\+\>\s*:"
syn match   cLabel          "\%(goto\s*\)\@<=\<\w\+\>"

if(g:rinzsyntax)
    syn match   cEnd            "\%(\%(for\|if\|while\).*\)\@<=[^)]*;$" contains=ALLBUT,cEnd
    syn match   cEnd            ";$"
    syn match   cBrackets       "\%(\%(for\|if\|while\)\s*\)\@<=("
    syn match   cBrackets       "\%(\%(for\|if\|while\)\s*(\%([^()]*([^()]*)\)*[^()]*\)\@<=)"
    syn match   cBrackets       "\%(\%(for\|if\|while\)\s*\%(([^()]*\)\{3}\%()[^()]*\)\{2}\)\@<=)"
    syn match   cBrackets       "\%(\%(for\|if\|while\)\s*\%(([^()]*\)\{3}\%()[^()]*\)\{2}([^()]*)[^()]*\)\@<=)"
    syn match   cBrackets       "\%(\%(for\|if\|while\)\s*\%(([^()]*\)\{2})[^()]*\%(([^()]*\)\{2}\%()[^()]*\)\{2}\)\@<=)"
    syn match   cSemicolon      "\%(for[^;]*\)\@<=;"
    syn match   cSemicolon      "\%(for[^;]*;[^;]*\)\@<=;"
    syn match   cMacro          "\%(^#define\s\S\+\s\)\@<=("
    syn match   cMacro          "\%(^#define\s\S\+\s(\S*\)\@<=)$"
endif


" ========================================================================= "
syn match   cppClass            "\%(\%(union\|struct\|class\)\s\+\)\@<=\<\w\+\>"
syn match   cppClass            "^\<[A-Z]\w*\>\%(\s*\.\)\@!"
syn keyword cppStatement        new delete this friend using
syn keyword cppAccess           public protected private
syn keyword cppModifier         inline virtual explicit export
syn keyword cppType             bool wchar_t
syn keyword cppExceptions       throw try catch
syn keyword cppOperator         operator typeid
syn keyword cppOperator         and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match   cppCast             "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match   cppCast             "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass     mutable
syn keyword cppStructure        class typename template namespace
syn keyword cppBoolean          true false
syn keyword cppConstant         __cplusplus

" C++ 11 extensions
if !exists("cpp_no_cpp11")
  syn keyword cppModifier	override final
  syn keyword cppType		nullptr_t auto
  syn keyword cppExceptions	noexcept
  syn keyword cppStorageClass	constexpr decltype thread_local
  syn keyword cppConstant	nullptr
  syn keyword cppConstant	ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
  syn keyword cppConstant	ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
  syn keyword cppConstant	ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
  syn keyword cppConstant	ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
  syn keyword cppConstant	ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
  syn keyword cppConstant	ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
  syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
endif

" C++ 14 extensions
if !exists("cpp_no_cpp14")
  syn case ignore
  syn match cppNumber		display "\<0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  syn match cppNumber		display "\<[1-9]\('\=\d\+\)*\(u\=l\{0,2}\|ll\=u\)\>" contains=cFloat
  syn match cppNumber		display "\<0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  syn case match
endif

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Defined
syn keyword cppSTD	        std cout cin endl
hi def link cppSTD  		Builtin

" ========================================================================= "
hi def link cppAccess		cppStatement
hi def link cppCast		cppStatement
hi def link cppExceptions		Exception
hi def link cppOperator		Operator
hi def link cppStatement		Statement
hi def link cppModifier		Type
hi def link cppType		Type
hi def link cppStorageClass	StorageClass
hi def link cppStructure		Structure
hi def link cppBoolean		Boolean
hi def link cppConstant		Constant
hi def link cppRawStringDelimiter	Delimiter
hi def link cppRawString		String
hi def link cppNumber		Number

hi def link cppClass            Comment
hi def link cStorageClass       Builtin
hi def link cQualifiedType      Builtin
hi def link cTypeDef            Builtin
hi def link cStatement          Statement
hi def link cRepeat             Statement
hi def link cLabel              Constant
hi def link cPreProc            Statement
hi def link cType               Type
hi def link cStructure          Type
hi def link cNumber             Type
hi def link cOperator           Operator
hi def link cInclude            Include
hi def link cIncluded           String
hi def link cMacro              Macro
hi def link cConstant           Constant
hi def link cCharacter          Character
hi def link cString             String
hi def link cSpecial            Special
hi def link cFormat             Special
hi def link cComment            Comment
hi def link cBrackets           Statement
hi def link cSemicolon          Statement
hi def link cMain               Statement
