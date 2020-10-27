" Vim syntax file
" Language:	Cpp
" Maintainer:	Rinz
" Last Change:	2020 Sep 9
if exists("b:current_syntax")
  finish
endif
let s:cpo_save = &cpo
set cpo&vim
source $VIMHOME/syntax/c.vim
let s:ft = matchstr(&ft, '^\([^.]\)\+')

" ========================================================================= "
syn match   cppClass        "\%(\<\)\@<=class\s\+\w\+\%(\s\|{\|$\)\@="
hi def link cppClass            Comment

syn match   cppReference    "\%(\<\)\@<=\%(char\|double\|float\|int\|void\)\s*&"
syn keyword cppAuto         auto
hi def link cppReference        SpecialItalic
hi def link cppAuto             Special

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

let b:current_syntax = "c"
unlet s:ft
let &cpo = s:cpo_save
unlet s:cpo_save
